sys_open:
    mov $0x2000005, %rax
    syscall
    ret

sys_close:
    mov $0x2000006, %rax
    syscall
    ret

sys_read:
    mov $0x2000003, %rax
    syscall
    ret

sys_write:
    mov $0x2000004, %rax
    syscall
    ret

