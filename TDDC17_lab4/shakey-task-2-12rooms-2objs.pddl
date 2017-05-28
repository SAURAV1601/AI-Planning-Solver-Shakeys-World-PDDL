
        ;; This is a problem definition for "Shakey's world" problem (Alternative 2).
        ;; We take for granted that the robot is autonomous for low-level tasks,
        ;; as an example, we only consider high-level actions such as moving the box
        ;; from a room to another room without caring about sub-tiles in the rooms
        ;; and other such small logistics details.

        ;; The goal of the agent (Shakey) is to tidy up the room by
        ;; placing every objects on the tablet.
        ;; Also, as initially, the lights must be all turned off and
        ;; the box replaced in room00 as initially.

        ;; Usage: ./ff -o shakey-domain.pddl -f shakey-task-2-12rooms-2objs.pddl
        ;; Usage: ./ipp -o shakey-domain.pddl -f shakey-task-2-12rooms-2objs.pddl



        (define (problem shakey-task-2-12rooms-2objs)
          (:domain shakey)
          (:objects
            ;; static:
            room00 room01 room02 room03 room10 room11 room12 room13 room20 room21 room22 room23
            tiny-door-00-01 tiny-door-00-10 tiny-door-00-11 tiny-door-00-12 tiny-door-00-13 tiny-door-00-21 tiny-door-01-02 tiny-door-01-10 tiny-door-01-11 tiny-door-01-12 tiny-door-01-13 tiny-door-01-22 tiny-door-02-03 tiny-door-02-10 tiny-door-02-11 tiny-door-02-12 tiny-door-02-13 tiny-door-02-23 tiny-door-03-10 tiny-door-03-11 tiny-door-03-12 tiny-door-03-13 tiny-door-10-01 tiny-door-10-11 tiny-door-10-20 tiny-door-10-21 tiny-door-10-22 tiny-door-10-23 tiny-door-11-02 tiny-door-11-12 tiny-door-11-20 tiny-door-11-21 tiny-door-11-22 tiny-door-11-23 tiny-door-12-03 tiny-door-12-13 tiny-door-12-20 tiny-door-12-21 tiny-door-12-22 tiny-door-12-23 tiny-door-13-20 tiny-door-13-21 tiny-door-13-22 tiny-door-13-23 tiny-door-20-01 tiny-door-20-11 tiny-door-20-21 tiny-door-21-02 tiny-door-21-12 tiny-door-21-22 tiny-door-22-03 tiny-door-22-13 tiny-door-22-23
            wide-door-00-01 wide-door-00-10 wide-door-00-11 wide-door-00-12 wide-door-00-13 wide-door-00-21 wide-door-01-02 wide-door-01-10 wide-door-01-11 wide-door-01-12 wide-door-01-13 wide-door-01-22 wide-door-02-03 wide-door-02-10 wide-door-02-11 wide-door-02-12 wide-door-02-13 wide-door-02-23 wide-door-03-10 wide-door-03-11 wide-door-03-12 wide-door-03-13 wide-door-10-01 wide-door-10-11 wide-door-10-20 wide-door-10-21 wide-door-10-22 wide-door-10-23 wide-door-11-02 wide-door-11-12 wide-door-11-20 wide-door-11-21 wide-door-11-22 wide-door-11-23 wide-door-12-03 wide-door-12-13 wide-door-12-20 wide-door-12-21 wide-door-12-22 wide-door-12-23 wide-door-13-20 wide-door-13-21 wide-door-13-22 wide-door-13-23 wide-door-20-01 wide-door-20-11 wide-door-20-21 wide-door-21-02 wide-door-21-12 wide-door-21-22 wide-door-22-03 wide-door-22-13 wide-door-22-23
            tablet
            ;; dynamic:
            shak
            grip1 grip2
            obj0 obj1
            box
          )
          (:init
            ;; static:
            (is-room room00) (is-room room01) (is-room room02) (is-room room03) (is-room room10) (is-room room11) (is-room room12) (is-room room13) (is-room room20) (is-room room21) (is-room room22) (is-room room23)
            (is-tiny-door tiny-door-00-01) (are-linked-by room00 room01 tiny-door-00-01) (are-linked-by room01 room00 tiny-door-00-01)
            (is-tiny-door tiny-door-00-10) (are-linked-by room00 room10 tiny-door-00-10) (are-linked-by room10 room00 tiny-door-00-10)
            (is-tiny-door tiny-door-00-11) (are-linked-by room00 room11 tiny-door-00-11) (are-linked-by room11 room00 tiny-door-00-11)
            (is-tiny-door tiny-door-00-12) (are-linked-by room00 room12 tiny-door-00-12) (are-linked-by room12 room00 tiny-door-00-12)
            (is-tiny-door tiny-door-00-13) (are-linked-by room00 room13 tiny-door-00-13) (are-linked-by room13 room00 tiny-door-00-13)
            (is-tiny-door tiny-door-00-21) (are-linked-by room00 room21 tiny-door-00-21) (are-linked-by room21 room00 tiny-door-00-21)
            (is-tiny-door tiny-door-01-02) (are-linked-by room01 room02 tiny-door-01-02) (are-linked-by room02 room01 tiny-door-01-02)
            (is-tiny-door tiny-door-01-10) (are-linked-by room01 room10 tiny-door-01-10) (are-linked-by room10 room01 tiny-door-01-10)
            (is-tiny-door tiny-door-01-11) (are-linked-by room01 room11 tiny-door-01-11) (are-linked-by room11 room01 tiny-door-01-11)
            (is-tiny-door tiny-door-01-12) (are-linked-by room01 room12 tiny-door-01-12) (are-linked-by room12 room01 tiny-door-01-12)
            (is-tiny-door tiny-door-01-13) (are-linked-by room01 room13 tiny-door-01-13) (are-linked-by room13 room01 tiny-door-01-13)
            (is-tiny-door tiny-door-01-22) (are-linked-by room01 room22 tiny-door-01-22) (are-linked-by room22 room01 tiny-door-01-22)
            (is-tiny-door tiny-door-02-03) (are-linked-by room02 room03 tiny-door-02-03) (are-linked-by room03 room02 tiny-door-02-03)
            (is-tiny-door tiny-door-02-10) (are-linked-by room02 room10 tiny-door-02-10) (are-linked-by room10 room02 tiny-door-02-10)
            (is-tiny-door tiny-door-02-11) (are-linked-by room02 room11 tiny-door-02-11) (are-linked-by room11 room02 tiny-door-02-11)
            (is-tiny-door tiny-door-02-12) (are-linked-by room02 room12 tiny-door-02-12) (are-linked-by room12 room02 tiny-door-02-12)
            (is-tiny-door tiny-door-02-13) (are-linked-by room02 room13 tiny-door-02-13) (are-linked-by room13 room02 tiny-door-02-13)
            (is-tiny-door tiny-door-02-23) (are-linked-by room02 room23 tiny-door-02-23) (are-linked-by room23 room02 tiny-door-02-23)
            (is-tiny-door tiny-door-03-10) (are-linked-by room03 room10 tiny-door-03-10) (are-linked-by room10 room03 tiny-door-03-10)
            (is-tiny-door tiny-door-03-11) (are-linked-by room03 room11 tiny-door-03-11) (are-linked-by room11 room03 tiny-door-03-11)
            (is-tiny-door tiny-door-03-12) (are-linked-by room03 room12 tiny-door-03-12) (are-linked-by room12 room03 tiny-door-03-12)
            (is-tiny-door tiny-door-03-13) (are-linked-by room03 room13 tiny-door-03-13) (are-linked-by room13 room03 tiny-door-03-13)
            (is-tiny-door tiny-door-10-01) (are-linked-by room10 room01 tiny-door-10-01) (are-linked-by room01 room10 tiny-door-10-01)
            (is-tiny-door tiny-door-10-11) (are-linked-by room10 room11 tiny-door-10-11) (are-linked-by room11 room10 tiny-door-10-11)
            (is-tiny-door tiny-door-10-20) (are-linked-by room10 room20 tiny-door-10-20) (are-linked-by room20 room10 tiny-door-10-20)
            (is-tiny-door tiny-door-10-21) (are-linked-by room10 room21 tiny-door-10-21) (are-linked-by room21 room10 tiny-door-10-21)
            (is-tiny-door tiny-door-10-22) (are-linked-by room10 room22 tiny-door-10-22) (are-linked-by room22 room10 tiny-door-10-22)
            (is-tiny-door tiny-door-10-23) (are-linked-by room10 room23 tiny-door-10-23) (are-linked-by room23 room10 tiny-door-10-23)
            (is-tiny-door tiny-door-11-02) (are-linked-by room11 room02 tiny-door-11-02) (are-linked-by room02 room11 tiny-door-11-02)
            (is-tiny-door tiny-door-11-12) (are-linked-by room11 room12 tiny-door-11-12) (are-linked-by room12 room11 tiny-door-11-12)
            (is-tiny-door tiny-door-11-20) (are-linked-by room11 room20 tiny-door-11-20) (are-linked-by room20 room11 tiny-door-11-20)
            (is-tiny-door tiny-door-11-21) (are-linked-by room11 room21 tiny-door-11-21) (are-linked-by room21 room11 tiny-door-11-21)
            (is-tiny-door tiny-door-11-22) (are-linked-by room11 room22 tiny-door-11-22) (are-linked-by room22 room11 tiny-door-11-22)
            (is-tiny-door tiny-door-11-23) (are-linked-by room11 room23 tiny-door-11-23) (are-linked-by room23 room11 tiny-door-11-23)
            (is-tiny-door tiny-door-12-03) (are-linked-by room12 room03 tiny-door-12-03) (are-linked-by room03 room12 tiny-door-12-03)
            (is-tiny-door tiny-door-12-13) (are-linked-by room12 room13 tiny-door-12-13) (are-linked-by room13 room12 tiny-door-12-13)
            (is-tiny-door tiny-door-12-20) (are-linked-by room12 room20 tiny-door-12-20) (are-linked-by room20 room12 tiny-door-12-20)
            (is-tiny-door tiny-door-12-21) (are-linked-by room12 room21 tiny-door-12-21) (are-linked-by room21 room12 tiny-door-12-21)
            (is-tiny-door tiny-door-12-22) (are-linked-by room12 room22 tiny-door-12-22) (are-linked-by room22 room12 tiny-door-12-22)
            (is-tiny-door tiny-door-12-23) (are-linked-by room12 room23 tiny-door-12-23) (are-linked-by room23 room12 tiny-door-12-23)
            (is-tiny-door tiny-door-13-20) (are-linked-by room13 room20 tiny-door-13-20) (are-linked-by room20 room13 tiny-door-13-20)
            (is-tiny-door tiny-door-13-21) (are-linked-by room13 room21 tiny-door-13-21) (are-linked-by room21 room13 tiny-door-13-21)
            (is-tiny-door tiny-door-13-22) (are-linked-by room13 room22 tiny-door-13-22) (are-linked-by room22 room13 tiny-door-13-22)
            (is-tiny-door tiny-door-13-23) (are-linked-by room13 room23 tiny-door-13-23) (are-linked-by room23 room13 tiny-door-13-23)
            (is-tiny-door tiny-door-20-01) (are-linked-by room20 room01 tiny-door-20-01) (are-linked-by room01 room20 tiny-door-20-01)
            (is-tiny-door tiny-door-20-11) (are-linked-by room20 room11 tiny-door-20-11) (are-linked-by room11 room20 tiny-door-20-11)
            (is-tiny-door tiny-door-20-21) (are-linked-by room20 room21 tiny-door-20-21) (are-linked-by room21 room20 tiny-door-20-21)
            (is-tiny-door tiny-door-21-02) (are-linked-by room21 room02 tiny-door-21-02) (are-linked-by room02 room21 tiny-door-21-02)
            (is-tiny-door tiny-door-21-12) (are-linked-by room21 room12 tiny-door-21-12) (are-linked-by room12 room21 tiny-door-21-12)
            (is-tiny-door tiny-door-21-22) (are-linked-by room21 room22 tiny-door-21-22) (are-linked-by room22 room21 tiny-door-21-22)
            (is-tiny-door tiny-door-22-03) (are-linked-by room22 room03 tiny-door-22-03) (are-linked-by room03 room22 tiny-door-22-03)
            (is-tiny-door tiny-door-22-13) (are-linked-by room22 room13 tiny-door-22-13) (are-linked-by room13 room22 tiny-door-22-13)
            (is-tiny-door tiny-door-22-23) (are-linked-by room22 room23 tiny-door-22-23) (are-linked-by room23 room22 tiny-door-22-23)
            (is-wide-door wide-door-00-01) (are-linked-by room00 room01 wide-door-00-01) (are-linked-by room01 room00 wide-door-00-01)
            (is-wide-door wide-door-00-10) (are-linked-by room00 room10 wide-door-00-10) (are-linked-by room10 room00 wide-door-00-10)
            (is-wide-door wide-door-00-11) (are-linked-by room00 room11 wide-door-00-11) (are-linked-by room11 room00 wide-door-00-11)
            (is-wide-door wide-door-00-12) (are-linked-by room00 room12 wide-door-00-12) (are-linked-by room12 room00 wide-door-00-12)
            (is-wide-door wide-door-00-13) (are-linked-by room00 room13 wide-door-00-13) (are-linked-by room13 room00 wide-door-00-13)
            (is-wide-door wide-door-00-21) (are-linked-by room00 room21 wide-door-00-21) (are-linked-by room21 room00 wide-door-00-21)
            (is-wide-door wide-door-01-02) (are-linked-by room01 room02 wide-door-01-02) (are-linked-by room02 room01 wide-door-01-02)
            (is-wide-door wide-door-01-10) (are-linked-by room01 room10 wide-door-01-10) (are-linked-by room10 room01 wide-door-01-10)
            (is-wide-door wide-door-01-11) (are-linked-by room01 room11 wide-door-01-11) (are-linked-by room11 room01 wide-door-01-11)
            (is-wide-door wide-door-01-12) (are-linked-by room01 room12 wide-door-01-12) (are-linked-by room12 room01 wide-door-01-12)
            (is-wide-door wide-door-01-13) (are-linked-by room01 room13 wide-door-01-13) (are-linked-by room13 room01 wide-door-01-13)
            (is-wide-door wide-door-01-22) (are-linked-by room01 room22 wide-door-01-22) (are-linked-by room22 room01 wide-door-01-22)
            (is-wide-door wide-door-02-03) (are-linked-by room02 room03 wide-door-02-03) (are-linked-by room03 room02 wide-door-02-03)
            (is-wide-door wide-door-02-10) (are-linked-by room02 room10 wide-door-02-10) (are-linked-by room10 room02 wide-door-02-10)
            (is-wide-door wide-door-02-11) (are-linked-by room02 room11 wide-door-02-11) (are-linked-by room11 room02 wide-door-02-11)
            (is-wide-door wide-door-02-12) (are-linked-by room02 room12 wide-door-02-12) (are-linked-by room12 room02 wide-door-02-12)
            (is-wide-door wide-door-02-13) (are-linked-by room02 room13 wide-door-02-13) (are-linked-by room13 room02 wide-door-02-13)
            (is-wide-door wide-door-02-23) (are-linked-by room02 room23 wide-door-02-23) (are-linked-by room23 room02 wide-door-02-23)
            (is-wide-door wide-door-03-10) (are-linked-by room03 room10 wide-door-03-10) (are-linked-by room10 room03 wide-door-03-10)
            (is-wide-door wide-door-03-11) (are-linked-by room03 room11 wide-door-03-11) (are-linked-by room11 room03 wide-door-03-11)
            (is-wide-door wide-door-03-12) (are-linked-by room03 room12 wide-door-03-12) (are-linked-by room12 room03 wide-door-03-12)
            (is-wide-door wide-door-03-13) (are-linked-by room03 room13 wide-door-03-13) (are-linked-by room13 room03 wide-door-03-13)
            (is-wide-door wide-door-10-01) (are-linked-by room10 room01 wide-door-10-01) (are-linked-by room01 room10 wide-door-10-01)
            (is-wide-door wide-door-10-11) (are-linked-by room10 room11 wide-door-10-11) (are-linked-by room11 room10 wide-door-10-11)
            (is-wide-door wide-door-10-20) (are-linked-by room10 room20 wide-door-10-20) (are-linked-by room20 room10 wide-door-10-20)
            (is-wide-door wide-door-10-21) (are-linked-by room10 room21 wide-door-10-21) (are-linked-by room21 room10 wide-door-10-21)
            (is-wide-door wide-door-10-22) (are-linked-by room10 room22 wide-door-10-22) (are-linked-by room22 room10 wide-door-10-22)
            (is-wide-door wide-door-10-23) (are-linked-by room10 room23 wide-door-10-23) (are-linked-by room23 room10 wide-door-10-23)
            (is-wide-door wide-door-11-02) (are-linked-by room11 room02 wide-door-11-02) (are-linked-by room02 room11 wide-door-11-02)
            (is-wide-door wide-door-11-12) (are-linked-by room11 room12 wide-door-11-12) (are-linked-by room12 room11 wide-door-11-12)
            (is-wide-door wide-door-11-20) (are-linked-by room11 room20 wide-door-11-20) (are-linked-by room20 room11 wide-door-11-20)
            (is-wide-door wide-door-11-21) (are-linked-by room11 room21 wide-door-11-21) (are-linked-by room21 room11 wide-door-11-21)
            (is-wide-door wide-door-11-22) (are-linked-by room11 room22 wide-door-11-22) (are-linked-by room22 room11 wide-door-11-22)
            (is-wide-door wide-door-11-23) (are-linked-by room11 room23 wide-door-11-23) (are-linked-by room23 room11 wide-door-11-23)
            (is-wide-door wide-door-12-03) (are-linked-by room12 room03 wide-door-12-03) (are-linked-by room03 room12 wide-door-12-03)
            (is-wide-door wide-door-12-13) (are-linked-by room12 room13 wide-door-12-13) (are-linked-by room13 room12 wide-door-12-13)
            (is-wide-door wide-door-12-20) (are-linked-by room12 room20 wide-door-12-20) (are-linked-by room20 room12 wide-door-12-20)
            (is-wide-door wide-door-12-21) (are-linked-by room12 room21 wide-door-12-21) (are-linked-by room21 room12 wide-door-12-21)
            (is-wide-door wide-door-12-22) (are-linked-by room12 room22 wide-door-12-22) (are-linked-by room22 room12 wide-door-12-22)
            (is-wide-door wide-door-12-23) (are-linked-by room12 room23 wide-door-12-23) (are-linked-by room23 room12 wide-door-12-23)
            (is-wide-door wide-door-13-20) (are-linked-by room13 room20 wide-door-13-20) (are-linked-by room20 room13 wide-door-13-20)
            (is-wide-door wide-door-13-21) (are-linked-by room13 room21 wide-door-13-21) (are-linked-by room21 room13 wide-door-13-21)
            (is-wide-door wide-door-13-22) (are-linked-by room13 room22 wide-door-13-22) (are-linked-by room22 room13 wide-door-13-22)
            (is-wide-door wide-door-13-23) (are-linked-by room13 room23 wide-door-13-23) (are-linked-by room23 room13 wide-door-13-23)
            (is-wide-door wide-door-20-01) (are-linked-by room20 room01 wide-door-20-01) (are-linked-by room01 room20 wide-door-20-01)
            (is-wide-door wide-door-20-11) (are-linked-by room20 room11 wide-door-20-11) (are-linked-by room11 room20 wide-door-20-11)
            (is-wide-door wide-door-20-21) (are-linked-by room20 room21 wide-door-20-21) (are-linked-by room21 room20 wide-door-20-21)
            (is-wide-door wide-door-21-02) (are-linked-by room21 room02 wide-door-21-02) (are-linked-by room02 room21 wide-door-21-02)
            (is-wide-door wide-door-21-12) (are-linked-by room21 room12 wide-door-21-12) (are-linked-by room12 room21 wide-door-21-12)
            (is-wide-door wide-door-21-22) (are-linked-by room21 room22 wide-door-21-22) (are-linked-by room22 room21 wide-door-21-22)
            (is-wide-door wide-door-22-03) (are-linked-by room22 room03 wide-door-22-03) (are-linked-by room03 room22 wide-door-22-03)
            (is-wide-door wide-door-22-13) (are-linked-by room22 room13 wide-door-22-13) (are-linked-by room13 room22 wide-door-22-13)
            (is-wide-door wide-door-22-23) (are-linked-by room22 room23 wide-door-22-23) (are-linked-by room23 room22 wide-door-22-23)
            (is-tablet tablet) (is-in tablet room00)
            ;; dynamic:
            (is-shakey shak) (is-in shak room00)
            (is-gripper grip1) (is-gripper-empty grip1)
            (is-gripper grip2) (is-gripper-empty grip2)
            (is-small-obj obj0) (is-on-floor obj0) (is-in obj0 room00)
            (is-small-obj obj1) (is-on-floor obj1) (is-in obj1 room01)
            (is-box box) (is-in box room00)
          )

          (:goal
            (and
              (is-in shak room00)
              (is-gripper-empty grip1)
              (is-gripper-empty grip2)
              (is-on-tablet obj0)
              (is-on-tablet obj1)
              (not (is-lit room00) )
              (not (is-lit room01) )
              (not (is-lit room02) )
              (not (is-lit room03) )
              (not (is-lit room10) )
              (not (is-lit room11) )
              (not (is-lit room12) )
              (not (is-lit room13) )
              (not (is-lit room20) )
              (not (is-lit room21) )
              (not (is-lit room22) )
              (not (is-lit room23) )
              (is-in box room00)
            )
          )
        )
        