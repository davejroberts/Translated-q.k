// indOne is indexOne, indTwo is indexTwo
// wj[w;c;t;(q;(::;`ask);(::;`bid))]
ww1: {[applyFn;qTabFiltered;indOne;indTwo] applyFn @' qTabFiltered @\: indOne + key indTwo - indOne}
ww:{[a;w;f;tTab;z]
    f,:();
    e: flip 1_ z; // remove the qTab and flip the (::;`ask);(::;`bid) portion
    qTab: first z; // get the quote table
    fn: $[count g:-1_ f; (f# qTab) bin @[f# tTab;last f;:;]@; qTab[first f] bin]; // Fn to apply on window to use bin to locate position
    index: $[count g; (g# qTab)? g# tTab; 0] |/: a+ fn each w; // Get indices of qTab falling within tTab 
    tTab ,' flip aggCl! flip ww1[first e; qTab @ aggCl: last e] .' flip index // Output of tTab appended with results from ww1
 }
wj:{[w;f;y;z] ww[0 1;w;f;y;z]};
wj1:{[w;f;y;z] ww[1;w - 1 0;f;y;z]}
