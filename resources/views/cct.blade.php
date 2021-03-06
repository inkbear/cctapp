<!DOCTYPE html>
<html>
  <head>
    <title>CCT App</title>
    <script src="jspsych/jspsych.js"></script>
    <script src="jspsych/plugins/jspsych-html-keyboard-response.js"></script>
    <script src="jspsych/plugins/jspsych-audio-button-response.js"></script>
    <script src="storage/{{ $experiment_data->cct_asset_path }}/trial_info.js"></script>
    <link href="jspsych/css/jspsych.css" rel="stylesheet" type="text/css"></link>
  </head>
  <body></body>
  <script>

    /* create timeline */
    var timeline = [];   

    /* timeline variables are loaded from trial_info.js */
    
    // create the array for preloading audio
    var all_audio = [];
    for (var i=0; i<trial_info.length; i++) {
        all_audio.push(trial_info[i].prompt_audio);
        all_audio.push(trial_info[i].feedback_audio);
    }

    // create the array for preloading images
    var all_images = [];
    for (var i=0; i<trial_info.length; i++) {
        all_images.push(trial_info[i].target_image);
        all_images.push(trial_info[i].distractor_image);
    }

    /* welcome message trial  */
    var welcome = {
        type: "html-keyboard-response",
        stimulus: "Welcome to the CCT App. Press any key to begin. ",
        data: {
            trial_part: 'welcome',
        }
    };
    timeline.push(welcome);

    /*  feedback trial plays audio feedback based on if_node trial */
    var feedback = {
        type: 'audio-button-response',
        stimulus: jsPsych.timelineVariable('feedback_audio'),   

        /* section: be sure this section matches the main_trial settings so the images stay put */
        choices: ['', ''], // button labels need to exist but are not displayed or stored
        button_html: [
            jsPsych.timelineVariable('target_image_button'),
            jsPsych.timelineVariable('distractor_image_button')
        ],
        margin_horizontal: "40px",
        /* end section */

        trial_ends_after_audio: true,
        data: {
            trial_part: 'feedback',
        },
    }

    /* main_trial loads two images as buttons and plays the audio prompt */
    var main_trial = {
        type: 'audio-button-response',
        stimulus: jsPsych.timelineVariable('prompt_audio'),
                
        /* section: be sure this section matches the main_trial settings so the images stay put */
        choices: ['', ''], // button labels need to exist but are not displayed or stored
        button_html: [
            jsPsych.timelineVariable('target_image_button'),
            jsPsych.timelineVariable('distractor_image_button')
        ],
        margin_horizontal: "40px",
        /* end section */

        trial_duration: 7000, // move on after 7 seconds
        data: {
            trial_part: 'test',
            target: jsPsych.timelineVariable('target'),
            distractor: jsPsych.timelineVariable('distractor'),
        },
        on_finish: function(data){
            if(data.button_pressed == 0){
                data.correct = true; 
            } else {
                data.correct = false;
            }
        },
    }

    /* decison trial for routing to audio feedback trial if the correct response was given in the previous trial (main_trial) */
    var if_node = {
        timeline: [feedback],
        conditional_function: function(){
            var correct = jsPsych.data.get().last(1).values()[0].correct;
            if(correct){
                return true;
            } else {
                return false;
            }
        }
    }
    
    /* blank_interval was added since feedback may or may not occur at the end fo the main_trail */
    var blank_interval = {
        type: "html-keyboard-response",
        stimulus: '',
        data: {
            trial_part: 'blank_interval',
        },
        trial_duration: 1000,
    };

    /* trial wrapper contains main_trial, the conditional for loading feedback audion, and a post trial blanking interval */
    var trial_wrapper = {
        timeline_variables: trial_info,
        timeline: [main_trial, if_node, blank_interval],
        repetitions: 1
    }
    timeline.push(trial_wrapper);

    /* exit message trial  */
    var exit = {
        type: "html-keyboard-response",
        stimulus: "Please exit through the gift shop. Press any key to continue. ",
        data: {
            trial_part: 'exit',
        }
    };
    timeline.push(exit);
    
    /* add meta data related to the entire experiment */
    jsPsych.data.addProperties({
        token: '{{ $experiment_data->token ?? '' }}',
        project_id: '{{ $experiment_data->project_id ?? '' }}', 
        project_name: '{{ $experiment_data->project_name ?? '' }}', 
        project_pi_id: '{{ $experiment_data->project_pi_id ?? '' }}', 
        experiment_id: '{{ $experiment_data->experiment_id ?? '' }}',
        experiment_name: '{{ $experiment_data->experiment_name ?? '' }}',
        note: '{{ $experiment_data->note ?? '' }}',
        cct_id: '{{ $experiment_data->cct_id }}',
        cct_version: '{{ $experiment_data->cct_version }}',
        cct_language: '{{ $experiment_data->cct_language }}',
        cct_name: '{{ $experiment_data->cct_name }}',
        cohort_id: '{{ $experiment_data->cohort_id ?? '' }}',
        cohort_name: '{{ $experiment_data->cohort_name ?? '' }}',
        participant_id: '{{ $experiment_data->participant_id ?? '' }}', 
        participant_identifier: '{{ $experiment_data->participant_identifier ?? '' }}', 
        participant_alias: '{{ $experiment_data->participant_alias ?? '' }}', 
        test_type: '{{ $experiment_data->test_type }}', 
    });

    
    function saveData() {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/data_catcher'); 
        // xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.setRequestHeader('X-CSRF-TOKEN', '{{ csrf_token() }}');
        xhr.send(jsPsych.data.get().json());
        // console.log(jsPsych.data.get().json());
        return;
    }

    
   /* log the start time/date for the experiment */
    var start_time = jsPsych.startTime();

    /* start the experiment */
    jsPsych.init({
        timeline: timeline,
        preload_audio: all_audio,
        preload_images: all_images,
        // show_preload_progress_bar: true,
        
        show_progress_bar: false,
        randomize_order: false,
        use_webaudio: false,
        // show the raw json data - to be removed for live
        on_finish: function() {
            if( '{{ $experiment_data->test_type }}' != 'preview' && '{{ $experiment_data->test_type }}' != 'ownerpreview') {
                saveData(); 
            }
            if( '{{ $experiment_data->test_type }}' != 'live' && '{{ $experiment_data->test_type }}' != 'test'){
                jsPsych.data.displayData();
            }
        }
    });

  </script>
</html>