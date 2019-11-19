unit =540
bill=0
slab = c(3.5,5,8)
index = 1
while(unit>0){
  if(unit>100){
    bill = bill + 100*slab[index]
    if(index!=3){
    index = index+1
    }
    }
  else{
    bill = bill + unit*slab[index]
  }
  unit = unit - 100
}

print(bill)

for(i in c("physics", "chemistry", "MBA", "cog_science","psychology")){
  switch(i,
         "physics": cutoff = 5,
           "chemistry": cutoff = 6,
         "MBA":cutoff=7,
         "cog_science": cutoff=8,
         "psychology": cutoff = 9
         )
}

