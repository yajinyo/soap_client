class ClientsController < ApplicationController
  def index
    url = "http://172.16.1.205:8080/axis2/services/UserManagementService?wsdl" 
    @driver = SOAP::WSDLDriverFactory.new(url).create_rpc_driver
    render :text => @driver.getVersion({}).m_return
  end
end
