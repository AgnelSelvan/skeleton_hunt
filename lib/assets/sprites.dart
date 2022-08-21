// const skeletonAsset =
//     '''16,16;5,0;6,1;9,0;8,1;8,0;4,1;1,0;1,1;1,0;1,1;8,0;4,1;1,0;1,1;1,0;1,1;9,0;6,1;11,0;1,1;1,0;1,1;1,0;1,1;26,0;7,1;8,0;1,1;1,0;5,1;1,0;1,1;6,0;1,1;4,0;1,1;4,0;1,1;5,0;2,1;1,0;5,1;1,0;2,1;5,0;2,1;2,0;3,1;2,0;2,1;8,0;2,1;1,0;2,1;10,0;2,1;3,0;2,1;9,0;1,1;4,0;1,1;10,0;2,1;3,0;2,1;4,0''';

// const mapAsset =
//     '''[{"x":2,"y":14,"data":{}},{"x":5,"y":14,"data":{"sprite":"idle_1"}},{"x":15,"y":15,"data":{"sprite":"ground"}},{"x":14,"y":15,"data":{"sprite":"ground"}},{"x":13,"y":15,"data":{"sprite":"ground"}},{"x":12,"y":15,"data":{"sprite":"ground"}},{"x":11,"y":15,"data":{"sprite":"ground"}},{"x":10,"y":15,"data":{"sprite":"ground"}},{"x":9,"y":15,"data":{"sprite":"ground"}},{"x":8,"y":15,"data":{"sprite":"ground"}},{"x":6,"y":15,"data":{"sprite":"ground"}},{"x":7,"y":15,"data":{"sprite":"ground"}},{"x":5,"y":15,"data":{"sprite":"ground"}},{"x":4,"y":15,"data":{"sprite":"ground"}},{"x":3,"y":15,"data":{"sprite":"ground"}},{"x":1,"y":15,"data":{"sprite":"ground"}},{"x":0,"y":15,"data":{"sprite":"ground"}},{"x":2,"y":15,"data":{"sprite":"ground"}},{"x":11,"y":13,"data":{"sprite":"ground"}},{"x":12,"y":13,"data":{"sprite":"ground"}}]''';

const library =
    '''sprite_4|16,16;5,0;6,1;9,0;8,1;8,0;1,1;1,0;1,1;1,0;4,1;8,0;1,1;1,0;1,1;1,0;4,1;9,0;6,1;10,0;1,1;1,0;1,1;1,0;1,1;27,0;7,1;8,0;1,1;1,0;5,1;1,0;1,1;6,0;1,1;4,0;1,1;4,0;1,1;5,0;2,1;1,0;5,1;1,0;2,1;5,0;2,1;2,0;3,1;2,0;2,1;8,0;2,1;1,0;2,1;10,0;2,1;3,0;2,1;10,0;1,1;4,0;1,1;9,0;2,1;3,0;2,1;4,0
sprite_5|16,16;5,0;6,1;9,0;8,1;8,0;1,1;1,0;1,1;1,0;4,1;9,0;6,1;10,0;1,1;1,0;1,1;1,0;1,1;27,0;7,1;8,0;1,1;1,0;5,1;1,0;1,1;6,0;1,1;4,0;1,1;4,0;1,1;5,0;2,1;1,0;5,1;1,0;2,1;5,0;2,1;2,0;3,1;2,0;2,1;8,0;2,1;1,0;2,1;10,0;2,1;3,0;2,1;10,0;1,1;4,0;1,1;10,0;1,1;4,0;1,1;9,0;2,1;3,0;2,1;4,0
idle_1|16,16;5,0;6,1;9,0;8,1;8,0;4,1;1,0;1,1;1,0;1,1;8,0;4,1;1,0;1,1;1,0;1,1;9,0;6,1;11,0;1,1;1,0;1,1;1,0;1,1;26,0;7,1;8,0;1,1;1,0;5,1;1,0;1,1;6,0;1,1;4,0;1,1;4,0;1,1;5,0;2,1;1,0;5,1;1,0;2,1;5,0;2,1;2,0;3,1;2,0;2,1;8,0;2,1;1,0;2,1;10,0;2,1;3,0;2,1;9,0;1,1;4,0;1,1;10,0;2,1;3,0;2,1;4,0
idle_2|16,16;5,0;6,1;9,0;8,1;8,0;4,1;1,0;1,1;1,0;1,1;9,0;6,1;11,0;1,1;1,0;1,1;1,0;1,1;26,0;7,1;8,0;1,1;1,0;5,1;1,0;1,1;6,0;1,1;4,0;1,1;4,0;1,1;5,0;2,1;1,0;5,1;1,0;2,1;5,0;2,1;2,0;3,1;2,0;2,1;8,0;2,1;1,0;2,1;10,0;2,1;3,0;2,1;9,0;1,1;4,0;1,1;10,0;1,1;4,0;1,1;10,0;2,1;3,0;2,1;4,0
ground|16,16;26,1;5,0;2,1;5,0;10,1;36,0;4,1;52,0;2,1;13,0;3,1;5,0;3,1;4,0;4,1;5,0;3,1;13,0;2,1;38,0;3,1;2,0;3,1;13,0
ground_left|16,16;26,1;5,0;3,1;4,0;12,1;14,0;2,1;14,0;2,1;3,0;3,1;5,0;1,1;2,0;2,1;9,0;3,1;2,0;2,1;9,0;3,1;2,0;2,1;9,0;2,1;3,0;2,1;9,0;1,1;4,0;2,1;14,0;2,1;2,0;2,1;10,0;2,1;2,0;1,1;11,0;2,1;7,0;3,1;4,0;2,1;14,0;3,1;13,0
ground_right|16,16;26,1;5,0;1,1;6,0;10,1;14,0;2,1;14,0;2,1;5,0;3,1;6,0;2,1;14,0;2,1;14,0;2,1;14,0;2,1;14,0;2,1;14,0;2,1;4,0;2,1;8,0;2,1;4,0;1,1;9,0;2,1;14,0;2,1;13,0;3,1;11,0;5,1
walk_1|16,16;5,0;6,1;9,0;8,1;8,0;4,1;1,0;1,1;1,0;1,1;8,0;4,1;1,0;1,1;1,0;1,1;9,0;6,1;11,0;1,1;1,0;1,1;1,0;1,1;27,0;5,1;10,0;1,1;1,0;3,1;1,0;1,1;8,0;1,1;3,0;1,1;3,0;1,1;7,0;1,1;2,0;3,1;2,0;1,1;7,0;2,1;1,0;3,1;1,0;2,1;10,0;1,1;1,0;2,1;10,0;3,1;2,0;1,1;10,0;1,1;4,0;1,1;15,0;2,1;4,0
walk_2|16,16;5,0;6,1;9,0;8,1;8,0;4,1;1,0;1,1;1,0;1,1;8,0;4,1;1,0;1,1;1,0;1,1;9,0;6,1;11,0;1,1;1,0;1,1;1,0;1,1;43,0;5,1;10,0;1,1;1,0;3,1;1,0;1,1;9,0;1,1;2,0;1,1;2,0;1,1;9,0;1,1;1,0;3,1;1,0;1,1;11,0;3,1;11,0;3,1;1,0;2,1;10,0;1,1;4,0;1,1;15,0;2,1;4,0
walk_3|16,16;5,0;6,1;9,0;8,1;8,0;4,1;1,0;1,1;1,0;1,1;8,0;4,1;1,0;1,1;1,0;1,1;9,0;6,1;11,0;1,1;1,0;1,1;1,0;1,1;44,0;4,1;11,0;1,1;1,0;2,1;1,0;1,1;10,0;1,1;1,0;1,1;2,0;1,1;10,0;1,1;1,0;2,1;1,0;1,1;11,0;3,1;11,0;2,1;2,0;1,1;11,0;1,1;3,0;1,1;15,0;2,1;5,0
walk_4|16,16;5,0;6,1;9,0;8,1;8,0;4,1;1,0;1,1;1,0;1,1;8,0;4,1;1,0;1,1;1,0;1,1;9,0;6,1;11,0;1,1;1,0;1,1;1,0;1,1;28,0;4,1;11,0;1,1;1,0;2,1;1,0;1,1;10,0;1,1;1,0;2,1;1,0;1,1;10,0;1,1;1,0;2,1;1,0;1,1;12,0;2,1;14,0;1,1;13,0;3,1;13,0;1,1;1,0;1,1;15,0;2,1;6,0
walk_5|16,16;5,0;6,1;9,0;8,1;8,0;4,1;1,0;1,1;1,0;1,1;8,0;4,1;1,0;1,1;1,0;1,1;9,0;6,1;11,0;1,1;1,0;1,1;1,0;1,1;27,0;5,1;10,0;1,1;1,0;3,1;1,0;1,1;9,0;1,1;2,0;1,1;2,0;1,1;9,0;1,1;2,0;1,1;2,0;1,1;11,0;3,1;13,0;1,1;1,0;1,1;12,0;2,1;2,0;1,1;11,0;1,1;3,0;1,1;11,0;2,1;2,0;2,1;4,0
enemy_1|16,16;5,0;6,1;9,0;8,1;8,0;4,1;1,0;1,1;1,0;1,1;8,0;4,1;1,0;1,1;1,0;1,1;9,0;6,1;11,0;1,1;1,0;1,1;1,0;1,1;26,0;7,1;8,0;1,1;1,0;5,1;1,0;4,1;3,0;1,1;4,0;1,1;5,0;2,1;3,0;2,1;1,0;5,1;8,0;2,1;2,0;3,1;12,0;2,1;1,0;2,1;10,0;2,1;3,0;2,1;9,0;1,1;4,0;1,1;10,0;2,1;3,0;2,1;4,0
enemy_2|16,16;5,0;6,1;9,0;8,1;8,0;4,1;1,0;1,1;1,0;1,1;8,0;4,1;1,0;1,1;1,0;1,1;9,0;6,1;11,0;1,1;1,0;1,1;1,0;1,1;28,0;9,1;6,0;1,1;1,0;2,1;4,0;2,1;7,0;6,1;11,0;2,1;1,0;2,1;11,0;2,1;14,0;1,1;13,0;3,1;13,0;1,1;1,0;1,1;15,0;2,1;6,0
enemy_3|16,16;5,0;6,1;9,0;8,1;8,0;4,1;1,0;1,1;1,0;1,1;8,0;4,1;1,0;1,1;1,0;1,1;9,0;6,1;11,0;1,1;1,0;1,1;1,0;1,1;28,0;8,1;8,0;3,1;14,0;6,1;10,0;2,1;14,0;2,1;13,0;1,1;1,0;1,1;11,0;3,1;1,0;1,1;11,0;1,1;3,0;1,1;15,0;2,1;5,0
enemy_4|16,16;5,0;6,1;9,0;8,1;8,0;4,1;1,0;1,1;1,0;1,1;8,0;4,1;1,0;1,1;1,0;1,1;9,0;6,1;11,0;1,1;1,0;1,1;1,0;1,1;28,0;9,1;6,0;1,1;1,0;2,1;4,0;2,1;7,0;6,1;11,0;2,1;1,0;2,1;11,0;2,1;13,0;1,1;1,0;1,1;11,0;3,1;1,0;1,1;11,0;1,1;3,0;1,1;15,0;2,1;5,0
healthbar_5|16,16;225,0;2,1;1,0;2,1;1,0;2,1;1,0;2,1;1,0;2,1;17,0
healthbar_4|16,16;225,0;2,1;1,0;2,1;1,0;2,1;1,0;2,1;20,0
healthbar_3|16,16;225,0;2,1;1,0;2,1;1,0;2,1;23,0
healthbar_2|16,16;225,0;2,1;1,0;2,1;26,0
healthbar_1|16,16;225,0;2,1;29,0
LOGO|16,16;21,0;7,1;8,0;9,1;6,0;11,1;4,0;13,1;3,0;4,1;2,0;1,1;2,0;4,1;3,0;4,1;2,0;1,1;2,0;4,1;3,0;4,1;2,0;1,1;2,0;4,1;4,0;11,1;6,0;9,1;9,0;5,1;11,0;1,1;1,0;1,1;1,0;1,1;27,0;1,1;1,0;1,1;1,0;1,1;11,0;5,1;21,0
dead_1|16,16;5,0;6,1;9,0;8,1;8,0;1,1;1,0;1,1;1,0;4,1;8,0;1,1;1,0;1,1;1,0;4,1;9,0;6,1;10,0;1,1;1,0;1,1;1,0;1,1;59,0;7,1;8,0;1,1;1,0;5,1;1,0;1,1;6,0;1,1;4,0;1,1;4,0;1,1;5,0;1,1;2,0;5,1;2,0;1,1;6,0;1,1;2,0;3,1;2,0;1,1;6,0;1,1;2,0;2,1;1,0;2,1;9,0;3,1;3,0;2,1;1,0;1,1;2,0
dead_2|16,16;5,0;6,1;9,0;8,1;8,0;1,1;1,0;1,1;1,0;4,1;8,0;1,1;1,0;1,1;1,0;4,1;9,0;6,1;10,0;1,1;1,0;1,1;1,0;1,1;74,0;1,1;1,0;1,1;1,0;2,1;2,0;1,1;16,0;1,1;5,0;1,1;2,0;1,1;3,0;1,1;2,0;1,1;7,0;1,1;2,0;2,1;2,0;1,1;6,0;1,1;3,0;4,1;9,0;8,1;1,0;1,1;1,0;1,1
dead_3|16,16;5,0;6,1;9,0;8,1;8,0;1,1;1,0;1,1;1,0;4,1;8,0;1,1;1,0;1,1;1,0;4,1;9,0;6,1;10,0;1,1;1,0;1,1;1,0;1,1;108,0;1,1;3,0;1,1;10,0;1,1;2,0;2,1;2,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;3,0;4,1;4,0;1,1;1,0;4,1;1,0;8,1;1,0;1,1
dead_4|16,16;69,0;6,1;9,0;8,1;8,0;1,1;1,0;1,1;1,0;4,1;8,0;1,1;1,0;1,1;1,0;4,1;9,0;6,1;10,0;1,1;1,0;1,1;1,0;1,1;44,0;1,1;3,0;1,1;10,0;1,1;2,0;2,1;2,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;3,0;4,1;4,0;1,1;1,0;4,1;1,0;8,1;1,0;1,1
dead_5|16,16;84,0;1,1;1,0;1,1;13,0;1,1;1,0;1,1;1,0;1,1;13,0;1,1;4,0;1,1;13,0;2,1;10,0;1,1;1,0;1,1;1,0;1,1;10,0;1,1;5,0;2,1;9,0;1,1;1,0;2,1;2,0;1,1;10,0;1,1;2,0;2,1;10,0;1,1;2,0;2,1;2,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;3,0;4,1;4,0;1,1;1,0;4,1;1,0;8,1;1,0;1,1
dead_6|16,16;137,0;1,1;26,0;1,1;39,0;3,1;6,0;2,1;3,0;2,1;8,0;1,1;4,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;1,0;1,1;4,0;1,1;2,0;2,1;4,0''';

// const library =
//     '''LOGO|28,38;79,0;1,1;1,0;1,1;1,0;1,1;2,0;1,1;6,0;1,1;22,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;3,0;1,1;1,0;1,1;27,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;1,0;1,1;24,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;1,0;1,1;24,0;1,1;1,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;1,0;1,1;2,0;1,1;60,0;1,1;36,0;3,1;5,0;1,1;3,0;1,1;3,0;1,1;9,0;1,1;12,0;1,1;3,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;1,0;1,1;11,0;1,1;2,0;1,1;2,0;1,1;3,0;3,1;2,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;2,0;1,1;14,0;1,1;1,0;1,1;3,0;2,1;1,0;1,1;1,0;1,1;1,0;1,1;3,0;1,1;2,0;1,1;3,0;2,1;64,0;1,1;22,0;1,1;7,0;1,1;3,0;1,1;1,0;3,1;8,0;4,1;8,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;3,0;1,1;8,0;2,1;1,0;3,1;7,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;4,0;1,1;2,0;1,1;7,0;2,1;2,0;4,1;7,0;1,1;3,0;1,1;3,0;2,1;1,0;1,1;4,0;1,1;6,0;5,1;1,0;2,1;8,0;1,1;20,0;3,1;1,0;1,1;2,0;2,1;11,0;1,1;16,0;1,1;1,0;7,1;6,0;1,1;4,0;1,1;1,0;1,1;1,0;7,1;1,0;2,1;1,0;1,1;3,0;1,1;1,0;5,1;3,0;2,1;3,0;8,1;1,0;2,1;4,0;4,1;5,0;2,1;6,0;2,1;5,0;5,1;5,0;3,1;5,0;4,1;4,0;6,1;4,0;36,1;1,0;1,1;2,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;2,0;1,1;4,0;1,1;3,0;1,1;2,0;1,1;4,0;1,1;2,0;1,1;2,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;1,0;1,1;1,0;15,1;2,0;2,1;4,0;1,1;2,0;1,1;1,0;1,1;1,0;1,1;2,0;1,1;4,0;1,1;3,0;1,1;10,0;1,1;3,0;1,1;2,0;1,1;2,0;1,1;1,0;1,1
// PLAYER|12,12;3,0;7,1;4,0;9,1;2,0;5,1;1,0;2,1;1,0;9,1;2,0;9,1;1,0;2,1;1,0;15,1;10,0;2,1;10,0;2,1;10,0;2,1;5,0;4,1;1,0;2,1;10,0;13,1
// SIMPLE_GROUND|12,12;12,1;3,0;2,1;5,0;1,1;14,0;1,1;25,0;1,1;3,0;1,1;2,0;1,1;19,0;1,1;7,0;1,1;45,0
// LEFT_GROUND|12,12;7,0;1,1;1,0;1,1;1,0;1,1;11,0;1,1;11,0;1,1;8,0;1,1;2,0;1,1;10,0;2,1;11,0;1,1;11,0;1,1;8,0;1,1;2,0;1,1;11,0;1,1;10,0;2,1;11,0;1,1;11,0;1,1
// RIGHT_GROUND|12,12;1,1;11,0;2,1;10,0;1,1;11,0;1,1;3,0;1,1;7,0;2,1;10,0;1,1;11,0;1,1;11,0;1,1;1,0;1,1;9,0;1,1;11,0;2,1;10,0;1,1;11,0;1,1;11,0
// TOP_GROUND_BLOCK|12,12;13,1;2,0;1,1;1,0;1,1;3,0;1,1;1,0;3,1;9,0;2,1;10,0;2,1;6,0;1,1;3,0;3,1;9,0;2,1;10,0;2,1;3,0;1,1;4,0;1,1;1,0;2,1;10,0;3,1;9,0;2,1;9,0;3,1;9,0;2,1
// CHEST|12,12;1,0;10,1;1,0;3,1;6,0;6,1;6,0;4,1;1,0;1,1;6,0;1,1;1,0;14,1;1,0;1,1;6,0;1,1;1,0;2,1;1,0;1,1;2,0;2,1;2,0;1,1;1,0;2,1;1,0;1,1;2,0;2,1;2,0;1,1;1,0;2,1;1,0;1,1;6,0;1,1;1,0;4,1;6,0;7,1;4,0;16,1''';
