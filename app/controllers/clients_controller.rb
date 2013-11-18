class ClientsController < ApplicationController
  def index
    url = "http://172.16.1.205:8080/axis2/services/UserManagementService?wsdl" 
    @driver = SOAP::WSDLDriverFactory.new(url).create_rpc_driver
    
    
    ret = @driver.getVersion({:address=> {:zipcode=> "6900011"}  }).m_return
    
    
    render :text => ret.address_list[0].prefecture.name
    
#    render :text => @driver.getVersion({:a=> {:b=> {:c=> "1"}     }      }).m_return
  end
end
