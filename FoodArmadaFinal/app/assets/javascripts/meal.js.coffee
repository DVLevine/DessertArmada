jQuery ->
  new AvatarCropper()

class AvatarCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#meal_crop_x').val(coords.x)
    $('#meal_crop_y').val(coords.y)
    $('#meal_crop_w').val(coords.w)
    $('#meal_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
          $('#preview').css
                  width: Math.round(100/coords.w * $('#cropbox').width()) + 'px'
                  height: Math.round(100/coords.h * $('#cropbox').height()) + 'px'
                  marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
                  marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'