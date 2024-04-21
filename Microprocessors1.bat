loop:
bis.b #10110110b,&P1DIR ; make P1.1 P1.2 P1.4 P1.5 P1.7 output
bis.b #00000101b,&P2DIR ; make P2.0 P2.2 output
bic.b #00001000b,&P1DIR ; make P1.3 input
bis.b #10110110b,&P1OUT ; clear P1.1 P1.2 P1.4 P1.5 P1.7 
 bis.b #00000101b,&P2OUT ; clear P2.0 P2.2
bic.b #10110110b,&P1OUT ; set P1.1 P1.2 P1.4 P1.5 P1.7 (for display 0)
bic.b #00000001b,&P2OUT ; set P2.0 (for display 0)
mov.w #8,r5 ; for delay execute r5 times(use in delay loop)
call #delay ; call delay
bis.b #10110110b,&P1OUT ; clear P1.1 P1.2 P1.4 P1.5 P1.7 
bis.b #00000101b,&P2OUT ; clear P2.0 P2.2
bic.b #00010100b,P1OUT ; set P1.2 P1.4 (for display 1)
mov.w #8,r5 ; for delay execute r5 times(use in delay loop)
call #delay ; call delay
bis.b #10110110b,&P1OUT ; clear P1.1 P1.2 P1.4 P1.5 P1.7
bis.b #00000101b,&P2OUT ; clear P2.0 P2.2
bic.b #10100110b,P1OUT ; set P1.1 P1.2 P1.5 P1.7 (for display 2)
bic.b #00000100b,&P2OUT ; set P2.2 (for display 2)
mov.w #8,r5 ; for delay execute r5 times(use in delay loop)
call #delay ; call delay
bis.b #10110110b,&P1OUT ; clear P1.1 P1.2 P1.4 P1.5 P1.7
bis.b #00000101b,&P2OUT ; clear P2.0 P2.2
bic.b #00110110b,P1OUT ; set P1.1 P1.2 P1.4 P1.5 (for display 3)
bic.b #00000100b,&P2OUT ; set P2.2 (for display 3)
mov.w #8,r5 ; for delay execute r5 times(use in delay loop)
call #delay ; call delay
bis.b #10110110b,P1OUT ; clear P1.1 P1.2 P1.4 P1.5 P1.7
bis.b #00000101b,P2OUT ; clear P2.0 P2.2
bic.b #00010100b,P1OUT ; set P1.2 P1.4 (for display 4)
bic.b #00000101b,P2OUT ; set P2.0 P2.2(for display 4)
mov.w #8,r5 ; for delay execute r5 times(use in delay loop)
call #delay ; call delay
bis.b #10110110b,P1OUT ; clear P1.1 P1.2 P1.4 P1.5 P1.7
bis.b #00000101b,P2OUT ; clear P2.0 P2.2
bic.b #00110010b,P1OUT ; set P1.1 P1.4 P1.5 (for display 5)
bic.b #00000101b,P2OUT ; set P2.0 P2.2(for display 5)
mov.w #8,r5 ; for delay execute r5 times(use in delay loop)
call #delay ; call delay
bis.b #10110110b,P1OUT ; clear P1.1 P1.2 P1.4 P1.5 P1.7
bis.b #00000101b,&P2OUT ; clear P2.0 P2.2
bic.b #10110010b,P1OUT ; set P1.1 P1.4 P1.5 P1.7 (for display 6)
bic.b #00000101b,&P2OUT ; set P2.0 P2.2 (for display 6)
mov.w #8,r5 ; for delay execute r5 times(use in delay loop)
call #delay ; call delay
bis.b #10110110b,&P1OUT ; clear P1.1 P1.2 P1.4 P1.5 P1.7
bis.b #00000101b,&P2OUT ; clear P2.0 P2.2
bic.b #00010110b,P1OUT ; set P1.1 P1.2 P1.4 (for display 7)
bic.b #00000000b,P2OUT ; set (for display 7)
mov.w #8,r5 ; for delay execute r5 times(use in delay loop)
call #delay ; call delay
bis.b #10110110b,&P1OUT ; clear P1.1 P1.2 P1.4 P1.5 P1.7
bis.b #00000101b,&P2OUT ; clear P2.0 P2.2
bic.b #10110110b,P1OUT;8 ; set P1.1 P1.2 P1.4 P1.5 P1.7 (for display 8)
bic.b #00000101b,&P2OUT ; set P2.0 P2.2 (for display 8)
mov.w #8,r5 ; for delay execute r5 times(use in delay loop)
call #delay ; call delay
bis.b #10110110b,&P1OUT ; clear P1.1 P1.2 P1.4 P1.5 P1.7
bis.b #00000101b,&P2OUT ; clear P2.0 P2.2
bic.b #00010110b,P1OUT ; set P1.1 P1.2 P1.4 (for display 9)
bic.b #00000101b,&P2OUT ; set P2.0 P2.2 (for display 9)
mov.w #8,r5 ; for delay execute r5 times(use in delay loop)
call #delay ; call delay
bis.b #10110110b,&P1OUT ; clear P1.1 P1.2 P1.4 P1.5 P1.7
bis.b #00000101b,&P2OUT ; clear P2.0 P2.2
call #loop ;go to loop
delay:
bit.b #00001000b,P1IN ; read switch at P1.3
jne off ;if not press go off,else go on
on:
mov.w #16000,r10; ;for find 0.5s 
jmp decrease ;jump decrease
off:
mov.w #32000,r10; ;for find 1s
decrease:
sub #1,r10 ;r10 =r10-1 (1 cycle)
cmp.w #0,r10 ; r10=0 ? (1 cycle)
jne decrease ;if not equal 0 jump decrease else go (2 cycle)
dec.w r5 ; r5=r5-1 (This delay makes the process happen 5 times)
jne delay ;if not zero jump delay else go
ret