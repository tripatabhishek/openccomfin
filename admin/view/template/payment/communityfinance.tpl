<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-community-checkout" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_cf_join; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-community-checkout" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="communityfinance_status" id="input-status" class="form-control">
                <?php if ($community_checkout_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-merchant-id"><?php echo $entry_merchant_id; ?></label>
            <div class="col-sm-10">
              <input type="text" name="communityfinance_checkout_merchant_id" value="<?php echo $checkout_merchant_id; ?>" placeholder="<?php echo $entry_merchant_id; ?>" id="input-merchant-id" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-access-key">API Key: </label>
            <div class="col-sm-10">
              <input type="text" name="communityfinance_checkout_api_key" value="<?php echo $checkout_api_key; ?>" placeholder="Enter API Key" id="input-access-key" class="form-control" />
            </div>
          </div>
           <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status">Payment Method: </label>
            <div class="col-sm-10">
              <select name="communityfinance_payment" id="community_payment" class="form-control">
                <option value="paypal" selected="selected">Paypal</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-key">Paypal Username: </label>
            <div class="col-sm-10">
              <input type="text" name="communityfinance_checkout_paypal_username" value="<?php echo $checkout_paypal_username; ?>" placeholder="Enter API Key" id="checkout_paypal_username" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-key">Paypal Password: </label>
            <div class="col-sm-10">
              <input type="text" name="communityfinance_checkout_paypal_password" value="<?php echo $checkout_paypal_password; ?>" placeholder="Enter API Key" id="checkout-paypal-password" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-key">Paypal Signature: </label>
            <div class="col-sm-10">
              <input type="text" name="communityfinance_checkout_paypal_signature" value="<?php echo $checkout_paypal_signature; ?>" placeholder="Enter API Key" id="checkout-paypal-signature" class="form-control" />
            </div>
          </div>

        </form>
      </div>
    </div>
  </div>
  </div>
<?php echo $footer; ?>