data = []
with open('in.txt', 'r') as f:
	for i in f.readlines():
		data.append(int(i.replace("\n", "")))

new = []

for i in data:
	new.append("\"{}\"".format(str(i+1)))
	new.append("\"{}\"".format(str(i-1)))
	new.append("\"{}\"".format(str(i+2)))
	new.append("\"{}\"".format(str(i-2)))

with open('out.txt', 'w') as f:
	for i in new:
		f.write(i)
		f.write(",\n")
	for i in data:
		f.write("\"{}\"".format(i))
		f.write(",\n")