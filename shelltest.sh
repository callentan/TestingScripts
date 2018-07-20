arr=("123_df", "asdasdsaudsus", "12312")

for a in ${arr[@]}
do
if [[$a =~ "_df"]||[$a =~ "us"]]
then
echo dfus
else
echo null
fi
done