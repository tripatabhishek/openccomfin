<?php 
class ControllerPaymentCommunityfinance extends Controller {
	private $error = array();
 
	public function index() {
        $this->language->load('payment/communityfinance');
        $this->document->setTitle('Community Finance Payment Method Configuration');
        $this->load->model('setting/setting');
     
        if (($this->request->server['REQUEST_METHOD'] == 'POST')) { 
          $this->model_setting_setting->editSetting('communityfinance', $this->request->post);
          $this->session->data['success'] = 'Saved.';
          $this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
        }
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_save'] = $this->language->get('button_save');
        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_cf_join'] = $this->language->get('text_cf_join');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['entry_merchant_id'] = $this->language->get('merchant_id');
        $data['checkout_merchant_id'] = $this->config->get('checkout_merchant_id');
        $data['checkout_api_key'] = $this->config->get('checkout_api_key');
        $data['checkout_paypal_username'] = $this->config->get('checkout_paypal_username');
        $data['checkout_paypal_password'] = $this->config->get('checkout_paypal_password');
        $data['checkout_paypal_signature'] = $this->config->get('checkout_paypal_signature');
        
        $data['action'] = $this->url->link('payment/communityfinance', 'token=' . $this->session->data['token'], 'SSL');
        $data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        $data['breadcrumbs'] = array();

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_home'),
                'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
            );

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_payment'),
                'href' => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL')
            );

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('heading_title'),
                'href' => $this->url->link('payment/communityfinance', 'token=' . $this->session->data['token'], 'SSL')
            );
            if (isset($this->error['warning'])) {
                $data['error_warning'] = $this->error['warning'];
            } else {
                $data['error_warning'] = '';
            }
     
        if (isset($this->request->post['text_config_one'])) {
          $data['text_config_one'] = $this->request->post['text_config_one'];
        } else {
          $data['text_config_one'] = $this->config->get('text_config_one');
        }
            
        if (isset($this->request->post['text_config_two'])) {
          $data['text_config_two'] = $this->request->post['text_config_two'];
        } else {
          $data['text_config_two'] = $this->config->get('text_config_two');
        }
                
        if (isset($this->request->post['custom_status'])) {
          $data['custom_status'] = $this->request->post['custom_status'];
        } else {
          $data['custom_status'] = $this->config->get('custom_status');
        }
            
        if (isset($this->request->post['custom_order_status_id'])) {
          $data['custom_order_status_id'] = $this->request->post['custom_order_status_id'];
        } else {
          $data['custom_order_status_id'] = $this->config->get('custom_order_status_id');
        }
     
        $this->load->model('localisation/order_status');
        $data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
                
        $this->children = array(
          'common/header',
          'common/footer'
        );
     
        $this->response->setOutput($this->load->view('payment/communityfinance.tpl', $data));
      }
        
        private function validate() {
        }
}
?>