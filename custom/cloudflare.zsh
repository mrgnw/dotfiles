r2s(){
	wrangler r2 bucket list | jq '.[].name'
}