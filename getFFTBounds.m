function out = getFFTBounds(signal)
   N = length(signal);
   
   if (mod(N, 2) == 0)
      out = -N/2 : (N/2 - 1);
   else
      out = -(N-1)/2 : (N-1)/2;
   endif
endfunction