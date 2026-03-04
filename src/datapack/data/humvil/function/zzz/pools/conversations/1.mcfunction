# @s is a player who will hear the conversation
# @n[tag=humvil.conversation.api.participant,tag=humvil.conversation.participant.1.this] ---> Participant 1

# Expected:
# humvil:pool conversations --> Array of conversations

# Add conversations to the pool:
data modify storage humvil:pool conversations append value [{"participant":1,"text":"{translate:'names.humvil.conversation.1.participants.1.line.1',with:[{selector:'@s'}]}"},{"participant":2,"text":"{translate:'names.humvil.conversation.1.participants.1.line.2'}"}]
data modify storage humvil:pool conversations append value [{"participant":1,"text":"{translate:'names.humvil.conversation.2.participants.1.line.1'}"}]
data modify storage humvil:pool conversations append value [{"participant":1,"text":"{translate:'names.humvil.conversation.3.participants.1.line.1'}"}]
data modify storage humvil:pool conversations append value [{"participant":1,"text":"{translate:'names.humvil.conversation.4.participants.1.line.1'}"}]
data modify storage humvil:pool conversations append value [{"participant":1,"text":"{translate:'names.humvil.conversation.5.participants.1.line.1',with:[{selector:'@s'}]}"}]
data modify storage humvil:pool conversations append value [{"participant":1,"text":"{translate:'names.humvil.conversation.6.participants.1.line.1'}"}]
data modify storage humvil:pool conversations append value [{"participant":1,"text":"{translate:'names.humvil.conversation.7.participants.1.line.1'}"}]
data modify storage humvil:pool conversations append value [{"participant":1,"text":"{translate:'names.humvil.conversation.8.participants.1.line.1'}"},{"participant":2,"text":"{translate:'names.humvil.conversation.8.participants.1.line.2'}"},{"participant":3,"text":"{translate:'names.humvil.conversation.8.participants.1.line.3'}"},{"participant":4,"text":"{translate:'names.humvil.conversation.8.participants.1.line.4'}"},{"participant":5,"text":"{translate:'names.humvil.conversation.8.participants.1.line.5'}"},{"participant":6,"text":"{translate:'names.humvil.conversation.8.participants.1.line.6'}"},{"participant":7,"text":"{translate:'names.humvil.conversation.8.participants.1.line.7'}"}]
data modify storage humvil:pool conversations append value [{"participant":1,"text":"{translate:'names.humvil.conversation.9.participants.1.line.1'}"},{"participant":2,"text":"{translate:'names.humvil.conversation.9.participants.1.line.2'}"}]
data modify storage humvil:pool conversations append value [{"participant":1,"text":"{translate:'names.humvil.conversation.10.participants.1.line.1'}"}]
data modify storage humvil:pool conversations append value [{"participant":1,"text":"{translate:'names.humvil.conversation.10.participants.1.line.1'}"}]
data modify storage humvil:pool conversations append value [{"participant":1,"text":"{translate:'names.humvil.conversation.11.participants.1.line.1',with:[{selector:'@s'}]}"},{"participant":2,"text":"{translate:'names.humvil.conversation.11.participants.1.line.2'}"},{"participant":3,"text":"{translate:'names.humvil.conversation.11.participants.1.line.3'}"},{"participant":4,"text":"{translate:'names.humvil.conversation.11.participants.1.line.4'}"},{"participant":5,"text":"{translate:'names.humvil.conversation.11.participants.1.line.5'}"},{"participant":6,"text":"{translate:'names.humvil.conversation.11.participants.1.line.6'}"},{"participant":7,"text":"{translate:'names.humvil.conversation.11.participants.1.line.7'}"},{"participant":8,"text":"{translate:'names.humvil.conversation.11.participants.1.line.8'}"}]
