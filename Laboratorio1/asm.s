        PUBLIC  __iar_program_start
        PUBLIC  __vector_table

        SECTION .text:CODE:REORDER(1)
        
        ;; Keep vector table even if it's not referenced
        REQUIRE __vector_table
        
        THUMB
        
__iar_program_start
        
main 

ex3     MOV R0 , #0x55
        MOV R1 , R0 , LSL #16
        MOV R2 , R1 , LSR #8
        MOV R3 , R2 , ASR #4
        MOV R4 , R3 , ROR #2
        MOV R5 , R4 , RRX

ex3_1   MOVS R0 , #0x55
        MOVS R1 , R0 , LSL #16
        MOVS R2 , R1 , LSR #8
        MOVS R3 , R2 , ASR #4
        MOVS R4 , R3 , ROR #2
        MOVS R5 , R4 , RRX
        
ex3_2   MVN R0 , #0x55
        MVN R1 , R0 , LSL #16
        MVN R2 , R1 , LSR #8
        MVN R3 , R2 , ASR #4
        MVN R4 , R3 , ROR #2
        MVN R5 , R4 , RRX
        
        B       main

        ;; Forward declaration of sections.
        SECTION CSTACK:DATA:NOROOT(3)
        SECTION .intvec:CODE:NOROOT(2)
        
        DATA

__vector_table
        DCD     sfe(CSTACK)
        DCD     __iar_program_start

        DCD     NMI_Handler
        DCD     HardFault_Handler
        DCD     MemManage_Handler
        DCD     BusFault_Handler
        DCD     UsageFault_Handler
        DCD     0
        DCD     0
        DCD     0
        DCD     0
        DCD     SVC_Handler
        DCD     DebugMon_Handler
        DCD     0
        DCD     PendSV_Handler
        DCD     SysTick_Handler

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Default interrupt handlers.
;;

        PUBWEAK NMI_Handler
        PUBWEAK HardFault_Handler
        PUBWEAK MemManage_Handler
        PUBWEAK BusFault_Handler
        PUBWEAK UsageFault_Handler
        PUBWEAK SVC_Handler
        PUBWEAK DebugMon_Handler
        PUBWEAK PendSV_Handler
        PUBWEAK SysTick_Handler

        SECTION .text:CODE:REORDER:NOROOT(1)
        THUMB

NMI_Handler
HardFault_Handler
MemManage_Handler
BusFault_Handler
UsageFault_Handler
SVC_Handler
DebugMon_Handler
PendSV_Handler
SysTick_Handler
Default_Handler
__default_handler
        CALL_GRAPH_ROOT __default_handler, "interrupt"
        NOCALL __default_handler
        B __default_handler

        END
