class ClientsController < ApplicationController
  def index
    url = "http://172.16.1.205:8080/axis2/services/UserManagementService?wsdl" 
    @driver = SOAP::WSDLDriverFactory.new(url).create_rpc_driver
    
    req_message = {
      :request => {
        :address => {
          :zipcode => "690-0001"
        }
      }
    }


 
    ret = @driver.get_address_list(req_message).m_return
    p ret  
###     binding.pry 
###    render :text => ret.address_list[0].prefecture.name
#    render :text => ret.result_code
    render :text => ret.address_list.prefecture.code + " " +
    ret.address_list.prefecture.name
    
  end
end
