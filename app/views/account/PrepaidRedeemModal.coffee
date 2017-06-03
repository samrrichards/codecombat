ModalView = require 'views/core/ModalView'
template = require 'templates/account/prepaid-redeem-modal'
{me} = require 'core/auth'


module.exports = class PrepaidRedeemModal extends ModalView
  id: 'prepaid-redeem-modal'
  template: template
  closeButton: true

  events:
    'click #redeem' : 'onClickRedeem'

  constructor: (options) ->
    super options
    @ppc = options.ppc
    hasRedeemed = @ppc.userHasRedeemed(me.get('_id'))
    @redeemedOn = new moment(hasRedeemed).calendar() if hasRedeemed

  onClickRedeem: ->
    @trigger 'confirm-redeem'
