//Share javascript code

const getBMI = function(weightInKg, heightInMt){
  try{
    return this.weight / (this.height * this.height);
  }catch(error){
    return undefined;
  }
}

export{getBMI};