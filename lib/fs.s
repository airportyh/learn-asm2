_sys_open:
    mov $0x2000005, %rax
    syscall
    ret

_sys_read:
    mov $0x2000003, %rax
    syscall
    ret

_sys_write:
    mov $0x2000004, %rax
    syscall
    ret

