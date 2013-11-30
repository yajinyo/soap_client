class AddressesController < ApplicationController

  def index
  end 

  def search

    url = "http://172.16.1.205:8080/axis2/services/UserManagementService?wsdl" 
    @driver = SOAP::WSDLDriverFactory.new(url).create_rpc_driver
    
    req_message = {
      :request => {
        :address => {
          :zipcode => params[:zipcode]
        }
      }
    }
 
    ret = @driver.get_address_list(req_message).m_return

    if ret.result_code == "00" then
      res = ret.address_list.municipality.code + 
            ret.address_list.prefecture.name +
            ret.address_list.municipality.name
    else
      res = "It is an address not existing."
    end

###     binding.pry 
#    render :text => ret.address_list[0].prefecture.name
#    render :text => ret.result_code
    render :text => res
  end
end
