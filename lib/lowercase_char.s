# %cl - character to lowercase
# output: %cl
_lowercase_char:
    cmp $65, %cl
    jl __lowercase_char_return
    cmp $90, %cl
    jg __lowercase_char_return
    add $32, %cl

__lowercase_char_return:
    ret