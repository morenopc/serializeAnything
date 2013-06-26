###########################################################################
###
    Serialize Anything
    (c) 2013 Moreno Cunha
###########################################################################
$::values = (data) ->
    inps = $(@).find(":input").get()
    if typeof data isnt "object"
        # return all data
        data = {}
        $.each inps, () ->
            if @.name and (
                @.checked or /select|textarea/i.test(@.nodeName)\
                or /text|hidden|password/i.test(@.type))
                data[@.name] = $(@).val()
        return data
    else
        $.each inps, () ->
            if @.name and data[@.name]
                if @.type is "checkbox" or @.type is "radio"
                    $(@).prop("checked", (data[@.name] is $(@).val()))
                else
                    $(@).val(data[@.name])
            else if @.type is "checkbox"
                $(@).prop("checked", false)
        return $(@)
