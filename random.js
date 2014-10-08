<script type="text/javascript">
        var current_light = 0;

         function repeatme(params){

         console.log('entered...');

         current_light = 0;

         if(params.light == 1){
         current_light = 1;
         startTest({light:Math.round(Math.random())})
         }

         }


         function startTest(params){

         setTimeout(function(){repeatme(params)}, 1000);
         }

         startTest({light:1});*/console.log('a');
    </script>
