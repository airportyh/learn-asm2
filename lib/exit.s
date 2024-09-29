sys_exit:
    mov $0x2000001, %rax
    syscall
    ret