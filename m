Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7D95E75879
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 15:12:15 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
From: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <55818E59.5040807@communistcode.co.uk>
Date: Wed, 17 Jun 2015 16:12:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.0.1
MIME-Version: 1.0
Subject: subversion configure failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jun 2015 15:12:19 -0000
X-Groupsio-MsgNum: 66876
Content-Type: multipart/mixed; boundary="------------030802070706020000070608"

--------------030802070706020000070608
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Seems to be some sort of python script failure? Is anyone else seeing 
this? I've dug around a little but can't see anything obvious.

Cheers,
Jack

Attached(2)

--------------030802070706020000070608
Content-Type: text/plain; charset=UTF-8;
 name="log.do_configure.28250"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="log.do_configure.28250"

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gc3lzcm9vdF9jbGVhbnNzdGF0ZQpERUJV
RzogUHl0aG9uIGZ1bmN0aW9uIHN5c3Jvb3RfY2xlYW5zc3RhdGUgZmluaXNoZWQKREVCVUc6IEV4
ZWN1dGluZyBzaGVsbCBmdW5jdGlvbiBhdXRvdG9vbHNfcHJlY29uZmlndXJlCkRFQlVHOiBTaGVs
bCBmdW5jdGlvbiBhdXRvdG9vbHNfcHJlY29uZmlndXJlIGZpbmlzaGVkCkRFQlVHOiBFeGVjdXRp
bmcgcHl0aG9uIGZ1bmN0aW9uIGF1dG90b29sc19jb3B5X2FjbG9jYWxzCkRFQlVHOiBTSVRFIGZp
bGVzIFsnZW5kaWFuLWxpdHRsZScsICdjb21tb24tbGludXgnLCAnY29tbW9uLWdsaWJjJywgJ2Jp
dC02NCcsICd4ODZfNjQtbGludXgnLCAnY29tbW9uJ10KREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBh
dXRvdG9vbHNfY29weV9hY2xvY2FscyBmaW5pc2hlZApERUJVRzogRXhlY3V0aW5nIHNoZWxsIGZ1
bmN0aW9uIGRvX2NvbmZpZ3VyZQphdXRvbWFrZSAoR05VIGF1dG9tYWtlKSAxLjE1CkNvcHlyaWdo
dCAoQykgMjAxNCBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KTGljZW5zZSBHUEx2Mis6
IEdOVSBHUEwgdmVyc2lvbiAyIG9yIGxhdGVyIDxodHRwOi8vZ251Lm9yZy9saWNlbnNlcy9ncGwt
Mi4wLmh0bWw+ClRoaXMgaXMgZnJlZSBzb2Z0d2FyZTogeW91IGFyZSBmcmVlIHRvIGNoYW5nZSBh
bmQgcmVkaXN0cmlidXRlIGl0LgpUaGVyZSBpcyBOTyBXQVJSQU5UWSwgdG8gdGhlIGV4dGVudCBw
ZXJtaXR0ZWQgYnkgbGF3LgoKV3JpdHRlbiBieSBUb20gVHJvbWV5IDx0cm9tZXlAcmVkaGF0LmNv
bT4KICAgICAgIGFuZCBBbGV4YW5kcmUgRHVyZXQtTHV0eiA8YWRsQGdudS5vcmc+LgpBVVRPViBp
cyAxCk5PVEU6IEV4ZWN1dGluZyBBQ0xPQ0FMPSJhY2xvY2FsIC0tc3lzdGVtLWFjZGlyPS9ob21l
L2phY2svV29yay9vZS1jb3JlLmdpdC90ZXN0LWJ1aWxkL3RtcC1nbGliYy93b3JrL3g4Nl82NC1s
aW51eC9zdWJ2ZXJzaW9uLW5hdGl2ZS8xLjguMTMtcjAvYnVpbGQvYWNsb2NhbC1jb3B5LyIgYXV0
b3JlY29uZiAtLXZlcmJvc2UgLS1pbnN0YWxsIC0tZm9yY2UgLS1leGNsdWRlPWF1dG9wb2ludCAt
SSBidWlsZC8gLUkgYnVpbGQvYWMtbWFjcm9zLwphdXRvcmVjb25mOiBFbnRlcmluZyBkaXJlY3Rv
cnkgYC4nCmF1dG9yZWNvbmY6IGNvbmZpZ3VyZS5hYzogbm90IHVzaW5nIEdldHRleHQKYXV0b3Jl
Y29uZjogcnVubmluZzogYWNsb2NhbCAtLXN5c3RlbS1hY2Rpcj0vaG9tZS9qYWNrL1dvcmsvb2Ut
Y29yZS5naXQvdGVzdC1idWlsZC90bXAtZ2xpYmMvd29yay94ODZfNjQtbGludXgvc3VidmVyc2lv
bi1uYXRpdmUvMS44LjEzLXIwL2J1aWxkL2FjbG9jYWwtY29weS8gLUkgYnVpbGQvIC1JIGJ1aWxk
L2FjLW1hY3Jvcy8gLUkgYnVpbGQvIC1JIGJ1aWxkL2FjLW1hY3Jvcy8gLS1mb3JjZSAKYnVpbGQv
YWMtbWFjcm9zL3psaWIubTQ6MjY6IHdhcm5pbmc6IHVuZGVycXVvdGVkIGRlZmluaXRpb24gb2Yg
U1ZOX0xJQl9aCmJ1aWxkL2FjLW1hY3Jvcy96bGliLm00OjI2OiAgIHJ1biBpbmZvIEF1dG9tYWtl
ICdFeHRlbmRpbmcgYWNsb2NhbCcKYnVpbGQvYWMtbWFjcm9zL3psaWIubTQ6MjY6ICAgb3Igc2Vl
IGh0dHA6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9hdXRvbWFrZS9tYW51YWwvYXV0b21ha2UuaHRt
bCNFeHRlbmRpbmctYWNsb2NhbAphdXRvcmVjb25mOiBjb25maWd1cmUuYWM6IHRyYWNpbmcKYXV0
b3JlY29uZjogcnVubmluZzogbGlidG9vbGl6ZSAtLWNvcHkgLS1mb3JjZQpsaWJ0b29saXplOiBw
dXR0aW5nIGF1eGlsaWFyeSBmaWxlcyBpbiBBQ19DT05GSUdfQVVYX0RJUiwgJ2J1aWxkJy4KbGli
dG9vbGl6ZTogY29weWluZyBmaWxlICdidWlsZC9sdG1haW4uc2gnCmxpYnRvb2xpemU6IFJlbWVt
YmVyIHRvIGFkZCAnTFRfSU5JVCcgdG8gY29uZmlndXJlLmFjLgpsaWJ0b29saXplOiBDb25zaWRl
ciBhZGRpbmcgJ0FDX0NPTkZJR19NQUNST19ESVJTKFttNF0pJyB0byBjb25maWd1cmUuYWMsCmxp
YnRvb2xpemU6IGFuZCByZXJ1bm5pbmcgbGlidG9vbGl6ZSBhbmQgYWNsb2NhbC4KbGlidG9vbGl6
ZTogQ29uc2lkZXIgYWRkaW5nICctSSBtNCcgdG8gQUNMT0NBTF9BTUZMQUdTIGluIE1ha2VmaWxl
LmFtLgpidWlsZC9hYy1tYWNyb3MvemxpYi5tNDoyNjogd2FybmluZzogdW5kZXJxdW90ZWQgZGVm
aW5pdGlvbiBvZiBTVk5fTElCX1oKYnVpbGQvYWMtbWFjcm9zL3psaWIubTQ6MjY6ICAgcnVuIGlu
Zm8gQXV0b21ha2UgJ0V4dGVuZGluZyBhY2xvY2FsJwpidWlsZC9hYy1tYWNyb3MvemxpYi5tNDoy
NjogICBvciBzZWUgaHR0cDovL3d3dy5nbnUub3JnL3NvZnR3YXJlL2F1dG9tYWtlL21hbnVhbC9h
dXRvbWFrZS5odG1sI0V4dGVuZGluZy1hY2xvY2FsCmF1dG9yZWNvbmY6IHJ1bm5pbmc6IC9ob21l
L2phY2svV29yay9vZS1jb3JlLmdpdC90ZXN0LWJ1aWxkL3RtcC1nbGliYy9zeXNyb290cy94ODZf
NjQtbGludXgvdXNyL2Jpbi9hdXRvY29uZiAtLWluY2x1ZGU9YnVpbGQvIC0taW5jbHVkZT1idWls
ZC9hYy1tYWNyb3MvIC0tZm9yY2UKYXV0b3JlY29uZjogcnVubmluZzogL2hvbWUvamFjay9Xb3Jr
L29lLWNvcmUuZ2l0L3Rlc3QtYnVpbGQvdG1wLWdsaWJjL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91
c3IvYmluL2F1dG9oZWFkZXIgLS1pbmNsdWRlPWJ1aWxkLyAtLWluY2x1ZGU9YnVpbGQvYWMtbWFj
cm9zLyAtLWZvcmNlCmF1dG9yZWNvbmY6IGNvbmZpZ3VyZS5hYzogbm90IHVzaW5nIEF1dG9tYWtl
CmF1dG9yZWNvbmY6IHJ1bm5pbmc6IGdudS1jb25maWdpemUKYXV0b3JlY29uZjogTGVhdmluZyBk
aXJlY3RvcnkgYC4nCk5PVEU6IFJ1bm5pbmcgL2hvbWUvamFjay9Xb3JrL29lLWNvcmUuZ2l0L3Rl
c3QtYnVpbGQvdG1wLWdsaWJjL3dvcmsveDg2XzY0LWxpbnV4L3N1YnZlcnNpb24tbmF0aXZlLzEu
OC4xMy1yMC9zdWJ2ZXJzaW9uLTEuOC4xMy9jb25maWd1cmUgIC0tYnVpbGQ9eDg2XzY0LWxpbnV4
IAkJICAtLWhvc3Q9eDg2XzY0LWxpbnV4IAkJICAtLXRhcmdldD14ODZfNjQtbGludXggCQkgIC0t
cHJlZml4PS9ob21lL2phY2svV29yay9vZS1jb3JlLmdpdC90ZXN0LWJ1aWxkL3RtcC1nbGliYy9z
eXNyb290cy94ODZfNjQtbGludXgvdXNyIAkJICAtLWV4ZWNfcHJlZml4PS9ob21lL2phY2svV29y
ay9vZS1jb3JlLmdpdC90ZXN0LWJ1aWxkL3RtcC1nbGliYy9zeXNyb290cy94ODZfNjQtbGludXgv
dXNyIAkJICAtLWJpbmRpcj0vaG9tZS9qYWNrL1dvcmsvb2UtY29yZS5naXQvdGVzdC1idWlsZC90
bXAtZ2xpYmMvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9iaW4gCQkgIC0tc2JpbmRpcj0vaG9t
ZS9qYWNrL1dvcmsvb2UtY29yZS5naXQvdGVzdC1idWlsZC90bXAtZ2xpYmMvc3lzcm9vdHMveDg2
XzY0LWxpbnV4L3Vzci9zYmluIAkJICAtLWxpYmV4ZWNkaXI9L2hvbWUvamFjay9Xb3JrL29lLWNv
cmUuZ2l0L3Rlc3QtYnVpbGQvdG1wLWdsaWJjL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvbGli
L3N1YnZlcnNpb24gCQkgIC0tZGF0YWRpcj0vaG9tZS9qYWNrL1dvcmsvb2UtY29yZS5naXQvdGVz
dC1idWlsZC90bXAtZ2xpYmMvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9zaGFyZSAJCSAgLS1z
eXNjb25mZGlyPS9ob21lL2phY2svV29yay9vZS1jb3JlLmdpdC90ZXN0LWJ1aWxkL3RtcC1nbGli
Yy9zeXNyb290cy94ODZfNjQtbGludXgvZXRjIAkJICAtLXNoYXJlZHN0YXRlZGlyPS9ob21lL2ph
Y2svV29yay9vZS1jb3JlLmdpdC90ZXN0LWJ1aWxkL3RtcC1nbGliYy9zeXNyb290cy94ODZfNjQt
bGludXgvY29tIAkJICAtLWxvY2Fsc3RhdGVkaXI9L2hvbWUvamFjay9Xb3JrL29lLWNvcmUuZ2l0
L3Rlc3QtYnVpbGQvdG1wLWdsaWJjL3N5c3Jvb3RzL3g4Nl82NC1saW51eC92YXIgCQkgIC0tbGli
ZGlyPS9ob21lL2phY2svV29yay9vZS1jb3JlLmdpdC90ZXN0LWJ1aWxkL3RtcC1nbGliYy9zeXNy
b290cy94ODZfNjQtbGludXgvdXNyL2xpYiAJCSAgLS1pbmNsdWRlZGlyPS9ob21lL2phY2svV29y
ay9vZS1jb3JlLmdpdC90ZXN0LWJ1aWxkL3RtcC1nbGliYy9zeXNyb290cy94ODZfNjQtbGludXgv
dXNyL2luY2x1ZGUgCQkgIC0tb2xkaW5jbHVkZWRpcj0vaG9tZS9qYWNrL1dvcmsvb2UtY29yZS5n
aXQvdGVzdC1idWlsZC90bXAtZ2xpYmMvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9pbmNsdWRl
IAkJICAtLWluZm9kaXI9L2hvbWUvamFjay9Xb3JrL29lLWNvcmUuZ2l0L3Rlc3QtYnVpbGQvdG1w
LWdsaWJjL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3Ivc2hhcmUvaW5mbyAJCSAgLS1tYW5kaXI9
L2hvbWUvamFjay9Xb3JrL29lLWNvcmUuZ2l0L3Rlc3QtYnVpbGQvdG1wLWdsaWJjL3N5c3Jvb3Rz
L3g4Nl82NC1saW51eC91c3Ivc2hhcmUvbWFuIAkJICAtLWRpc2FibGUtc2lsZW50LXJ1bGVzIAkJ
ICAtLWRpc2FibGUtZGVwZW5kZW5jeS10cmFja2luZyAJCSAgICAgICAgICAgICAgICAgICAgLS13
aXRob3V0LWJlcmtlbGV5LWRiIC0td2l0aG91dC1hcHhzICAgICAgICAgICAgICAgICAtLXdpdGhv
dXQtc3dpZyAtLXdpdGgtYXByPS9ob21lL2phY2svV29yay9vZS1jb3JlLmdpdC90ZXN0LWJ1aWxk
L3RtcC1nbGliYy9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2JpbiAgICAgICAgICAgICAgICAg
LS13aXRoLWFwci11dGlsPS9ob21lL2phY2svV29yay9vZS1jb3JlLmdpdC90ZXN0LWJ1aWxkL3Rt
cC1nbGliYy9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2JpbiAgICAgICAgICAgICAgICAgLS1k
aXNhYmxlLWtleWNoYWluICAgICAgICAgICAgICAgICBhY19jdl9wYXRoX1JVQlk9bm9uZSAtLWRp
c2FibGUtbmxzIC0td2l0aG91dC1nbm9tZS1rZXlyaW5nIC0td2l0aG91dC1zYXNsIApjb25maWd1
cmU6IFdBUk5JTkc6IHVucmVjb2duaXplZCBvcHRpb25zOiAtLWRpc2FibGUtc2lsZW50LXJ1bGVz
LCAtLWRpc2FibGUtZGVwZW5kZW5jeS10cmFja2luZwpjb25maWd1cmU6IGxvYWRpbmcgc2l0ZSBz
Y3JpcHQgL2hvbWUvamFjay9Xb3JrL29lLWNvcmUuZ2l0L21ldGEvc2l0ZS9lbmRpYW4tbGl0dGxl
CmNvbmZpZ3VyZTogbG9hZGluZyBzaXRlIHNjcmlwdCAvaG9tZS9qYWNrL1dvcmsvb2UtY29yZS5n
aXQvbWV0YS9zaXRlL2NvbW1vbi1saW51eApjb25maWd1cmU6IGxvYWRpbmcgc2l0ZSBzY3JpcHQg
L2hvbWUvamFjay9Xb3JrL29lLWNvcmUuZ2l0L21ldGEvc2l0ZS9jb21tb24tZ2xpYmMKY29uZmln
dXJlOiBsb2FkaW5nIHNpdGUgc2NyaXB0IC9ob21lL2phY2svV29yay9vZS1jb3JlLmdpdC9tZXRh
L3NpdGUveDg2XzY0LWxpbnV4CmNvbmZpZ3VyZTogbG9hZGluZyBzaXRlIHNjcmlwdCAvaG9tZS9q
YWNrL1dvcmsvb2UtY29yZS5naXQvbWV0YS9zaXRlL2NvbW1vbgpjb25maWd1cmU6IGxvYWRpbmcg
c2l0ZSBzY3JpcHQgL2hvbWUvamFjay9Xb3JrL29lLWNvcmUuZ2l0L3Rlc3QtYnVpbGQvdG1wLWds
aWJjL3dvcmsveDg2XzY0LWxpbnV4L3N1YnZlcnNpb24tbmF0aXZlLzEuOC4xMy1yMC9idWlsZC9h
Y2xvY2FsLWNvcHkvbmN1cnNlc19jb25maWcKY29uZmlndXJlOiBDb25maWd1cmluZyBTdWJ2ZXJz
aW9uIDEuOC4xMwpjb25maWd1cmU6IGNyZWF0aW5nIGNvbmZpZy5uaWNlCmNoZWNraW5nIGZvciB4
ODZfNjQtbGludXgtZ2NjLi4uIGdjYyAKY2hlY2tpbmcgd2hldGhlciB0aGUgQyBjb21waWxlciB3
b3Jrcy4uLiB5ZXMKY2hlY2tpbmcgZm9yIEMgY29tcGlsZXIgZGVmYXVsdCBvdXRwdXQgZmlsZSBu
YW1lLi4uIGEub3V0CmNoZWNraW5nIGZvciBzdWZmaXggb2YgZXhlY3V0YWJsZXMuLi4gCmNoZWNr
aW5nIHdoZXRoZXIgd2UgYXJlIGNyb3NzIGNvbXBpbGluZy4uLiBubwpjaGVja2luZyBmb3Igc3Vm
Zml4IG9mIG9iamVjdCBmaWxlcy4uLiBvCmNoZWNraW5nIHdoZXRoZXIgd2UgYXJlIHVzaW5nIHRo
ZSBHTlUgQyBjb21waWxlci4uLiB5ZXMKY2hlY2tpbmcgd2hldGhlciBnY2MgIGFjY2VwdHMgLWcu
Li4geWVzCmNoZWNraW5nIGZvciBnY2MgIG9wdGlvbiB0byBhY2NlcHQgSVNPIEM4OS4uLiBub25l
IG5lZWRlZApjaGVja2luZyBpZiBnY2MgIGFjY2VwdHMgLXN0ZD1jOTAuLi4geWVzCmNoZWNraW5n
IGlmIGdjYyAgYWNjZXB0cyAtV2Vycm9yPXVua25vd24td2FybmluZy1vcHRpb24uLi4gbm8KY2hl
Y2tpbmcgd2hldGhlciB3ZSBhcmUgdXNpbmcgdGhlIEdOVSBDKysgY29tcGlsZXIuLi4geWVzCmNo
ZWNraW5nIHdoZXRoZXIgZysrICBhY2NlcHRzIC1nLi4uIHllcwpjaGVja2luZyBpZiBnKysgIGFj
Y2VwdHMgLXN0ZD1jKys5OC4uLiB5ZXMKY2hlY2tpbmcgaWYgZysrICBhY2NlcHRzIC1XZXJyb3I9
dW5rbm93bi13YXJuaW5nLW9wdGlvbi4uLiBubwpjaGVja2luZyBob3cgdG8gcnVuIHRoZSBDIHBy
ZXByb2Nlc3Nvci4uLiBnY2MgIC1FCmNoZWNraW5nIGZvciBhIHNlZCB0aGF0IGRvZXMgbm90IHRy
dW5jYXRlIG91dHB1dC4uLiAoY2FjaGVkKSBzZWQKY2hlY2tpbmcgYnVpbGQgc3lzdGVtIHR5cGUu
Li4geDg2XzY0LXBjLWxpbnV4LWdudQpjaGVja2luZyBob3N0IHN5c3RlbSB0eXBlLi4uIHg4Nl82
NC1wYy1saW51eC1nbnUKY2hlY2tpbmcgdGFyZ2V0IHN5c3RlbSB0eXBlLi4uIHg4Nl82NC1wYy1s
aW51eC1nbnUKY2hlY2tpbmcgZm9yIGdyZXAgdGhhdCBoYW5kbGVzIGxvbmcgbGluZXMgYW5kIC1l
Li4uIC91c3IvYmluL2dyZXAKY2hlY2tpbmcgZm9yIGVncmVwLi4uIC91c3IvYmluL2dyZXAgLUUK
Y2hlY2tpbmcgd2hldGhlciBsbiAtcyB3b3Jrcy4uLiB5ZXMKY2hlY2tpbmcgZm9yIGEgQlNELWNv
bXBhdGlibGUgaW5zdGFsbC4uLiAvdXNyL2Jpbi9pbnN0YWxsIC1jCmNvbmZpZ3VyZTogQXBhY2hl
IFBvcnRhYmxlIFJ1bnRpbWUgKEFQUikgbGlicmFyeSBjb25maWd1cmF0aW9uCmNoZWNraW5nIGZv
ciBBUFIuLi4geWVzCmNoZWNraW5nIEFQUiB2ZXJzaW9uLi4uIDEuNS4yCmNvbmZpZ3VyZTogQXBh
Y2hlIFBvcnRhYmxlIFJ1bnRpbWUgVXRpbGl0eSAoQVBSVVRJTCkgbGlicmFyeSBjb25maWd1cmF0
aW9uCmNoZWNraW5nIGZvciBBUFItdXRpbC4uLiB5ZXMKY2hlY2tpbmcgQVBSVVRJTCB2ZXJzaW9u
Li4uIDEuNS40CmNoZWNraW5nIGZvciBwa2ctY29uZmlnLi4uIC9ob21lL2phY2svV29yay9vZS1j
b3JlLmdpdC90ZXN0LWJ1aWxkL3RtcC1nbGliYy9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2Jp
bi9wa2ctY29uZmlnCmNoZWNraW5nIGZvciBBTlNJIEMgaGVhZGVyIGZpbGVzLi4uIChjYWNoZWQp
IHllcwpjaGVja2luZyBmb3Igc3lzL3R5cGVzLmguLi4gKGNhY2hlZCkgeWVzCmNoZWNraW5nIGZv
ciBzeXMvc3RhdC5oLi4uIChjYWNoZWQpIHllcwpjaGVja2luZyBmb3Igc3RkbGliLmguLi4gKGNh
Y2hlZCkgeWVzCmNoZWNraW5nIGZvciBzdHJpbmcuaC4uLiAoY2FjaGVkKSB5ZXMKY2hlY2tpbmcg
Zm9yIG1lbW9yeS5oLi4uIChjYWNoZWQpIHllcwpjaGVja2luZyBmb3Igc3RyaW5ncy5oLi4uIChj
YWNoZWQpIHllcwpjaGVja2luZyBmb3IgaW50dHlwZXMuaC4uLiAoY2FjaGVkKSB5ZXMKY2hlY2tp
bmcgZm9yIHN0ZGludC5oLi4uIChjYWNoZWQpIHllcwpjaGVja2luZyBmb3IgdW5pc3RkLmguLi4g
KGNhY2hlZCkgeWVzCmNvbmZpZ3VyZTogc2VyZiBsaWJyYXJ5IGNvbmZpZ3VyYXRpb24gdmlhIHBr
Zy1jb25maWcKY2hlY2tpbmcgZm9yIHNlcmYtMiBsaWJyYXJ5Li4uIG5vCmNoZWNraW5nIGZvciBz
ZXJmLTEgbGlicmFyeS4uLiB5ZXMKY2hlY2tpbmcgc2VyZiBsaWJyYXJ5IHZlcnNpb24uLi4gMS4z
LjgKY2hlY2tpbmcgc2VyZiB2ZXJzaW9uIGlzIHN1aXRhYmxlLi4uIHllcwpjaGVja2luZyB3YXMg
c2VyZiBlbmFibGVkLi4uIHllcwpjb25maWd1cmU6IGxvb2tpbmcgZm9yIGFwcl9tZW1jYWNoZSBh
cyBwYXJ0IG9mIGFwci11dGlsCmNoZWNraW5nIGFwcl9tZW1jYWNoZS5oIHVzYWJpbGl0eS4uLiB5
ZXMKY2hlY2tpbmcgYXByX21lbWNhY2hlLmggcHJlc2VuY2UuLi4geWVzCmNoZWNraW5nIGZvciBh
cHJfbWVtY2FjaGUuaC4uLiB5ZXMKY2hlY2tpbmcgZm9yIGFwcl9tZW1jYWNoZV9jcmVhdGUgaW4g
LWxhcHJ1dGlsLTEuLi4geWVzCmNoZWNraW5nIGZvciBBcGFjaGUgbW9kdWxlIHN1cHBvcnQgdmlh
IERTTyB0aHJvdWdoIEFQWFMuLi4gbm8KY29uZmlndXJlOiBjaGVja2luZyBzcWxpdGUgbGlicmFy
eQpjaGVja2luZyBzcWxpdGUgYW1hbGdhbWF0aW9uLi4uIG5vCmNoZWNraW5nIHNxbGl0ZSBhbWFs
Z2FtYXRpb24uLi4gbm8KY2hlY2tpbmcgc3FsaXRlMy5oIHVzYWJpbGl0eS4uLiB5ZXMKY2hlY2tp
bmcgc3FsaXRlMy5oIHByZXNlbmNlLi4uIHllcwpjaGVja2luZyBmb3Igc3FsaXRlMy5oLi4uIHll
cwpjaGVja2luZyBzcWxpdGUgbGlicmFyeSB2ZXJzaW9uICh2aWEgaGVhZGVyKS4uLiBva2F5CmNo
ZWNraW5nIGZvciBzcWxpdGUzX2Nsb3NlIGluIC1sc3FsaXRlMy4uLiB5ZXMKY2hlY2tpbmcgd2hl
dGhlciB0aGUgY29tcGlsZXIgcHJvdmlkZXMgYXRvbWljIGJ1aWx0aW5zLi4uIHllcwpjb25maWd1
cmU6IGNvbmZpZ3VyaW5nIGxpYnRvb2wgbm93CmNoZWNraW5nIGhvdyB0byBwcmludCBzdHJpbmdz
Li4uIHByaW50ZgpjaGVja2luZyBmb3IgYSBzZWQgdGhhdCBkb2VzIG5vdCB0cnVuY2F0ZSBvdXRw
dXQuLi4gKGNhY2hlZCkgc2VkCmNoZWNraW5nIGZvciBmZ3JlcC4uLiAvdXNyL2Jpbi9ncmVwIC1G
CmNoZWNraW5nIGZvciBsZCB1c2VkIGJ5IGdjYyAuLi4gbGQgCmNoZWNraW5nIGlmIHRoZSBsaW5r
ZXIgKGxkICkgaXMgR05VIGxkLi4uIHllcwpjaGVja2luZyBmb3IgQlNELSBvciBNUy1jb21wYXRp
YmxlIG5hbWUgbGlzdGVyIChubSkuLi4gbm0KY2hlY2tpbmcgdGhlIG5hbWUgbGlzdGVyIChubSkg
aW50ZXJmYWNlLi4uIEJTRCBubQpjaGVja2luZyB0aGUgbWF4aW11bSBsZW5ndGggb2YgY29tbWFu
ZCBsaW5lIGFyZ3VtZW50cy4uLiAxNTcyODY0CmNoZWNraW5nIGhvdyB0byBjb252ZXJ0IHg4Nl82
NC1wYy1saW51eC1nbnUgZmlsZSBuYW1lcyB0byB4ODZfNjQtcGMtbGludXgtZ251IGZvcm1hdC4u
LiBmdW5jX2NvbnZlcnRfZmlsZV9ub29wCmNoZWNraW5nIGhvdyB0byBjb252ZXJ0IHg4Nl82NC1w
Yy1saW51eC1nbnUgZmlsZSBuYW1lcyB0byB0b29sY2hhaW4gZm9ybWF0Li4uIGZ1bmNfY29udmVy
dF9maWxlX25vb3AKY2hlY2tpbmcgZm9yIGxkICBvcHRpb24gdG8gcmVsb2FkIG9iamVjdCBmaWxl
cy4uLiAtcgpjaGVja2luZyBmb3IgeDg2XzY0LWxpbnV4LW9iamR1bXAuLi4gb2JqZHVtcApjaGVj
a2luZyBob3cgdG8gcmVjb2duaXplIGRlcGVuZGVudCBsaWJyYXJpZXMuLi4gcGFzc19hbGwKY2hl
Y2tpbmcgZm9yIHg4Nl82NC1saW51eC1kbGx0b29sLi4uIG5vCmNoZWNraW5nIGZvciBkbGx0b29s
Li4uIG5vCmNoZWNraW5nIGhvdyB0byBhc3NvY2lhdGUgcnVudGltZSBhbmQgbGluayBsaWJyYXJp
ZXMuLi4gcHJpbnRmICVzXG4KY2hlY2tpbmcgZm9yIHg4Nl82NC1saW51eC1hci4uLiBhcgpjaGVj
a2luZyBmb3IgYXJjaGl2ZXIgQEZJTEUgc3VwcG9ydC4uLiBACmNoZWNraW5nIGZvciB4ODZfNjQt
bGludXgtc3RyaXAuLi4gc3RyaXAKY2hlY2tpbmcgZm9yIHg4Nl82NC1saW51eC1yYW5saWIuLi4g
cmFubGliCmNoZWNraW5nIGZvciBnYXdrLi4uIGdhd2sKY2hlY2tpbmcgY29tbWFuZCB0byBwYXJz
ZSBubSBvdXRwdXQgZnJvbSBnY2MgIG9iamVjdC4uLiBvawpjaGVja2luZyBmb3Igc3lzcm9vdC4u
LiBubwpjaGVja2luZyBmb3IgYSB3b3JraW5nIGRkLi4uIC91c3IvYmluL2RkCmNoZWNraW5nIGhv
dyB0byB0cnVuY2F0ZSBiaW5hcnkgcGlwZXMuLi4gL3Vzci9iaW4vZGQgYnM9NDA5NiBjb3VudD0x
CmNoZWNraW5nIGZvciB4ODZfNjQtbGludXgtbXQuLi4gbm8KY2hlY2tpbmcgZm9yIG10Li4uIG5v
CmNoZWNraW5nIGlmIDogaXMgYSBtYW5pZmVzdCB0b29sLi4uIG5vCmNoZWNraW5nIGZvciBkbGZj
bi5oLi4uIHllcwpjaGVja2luZyBmb3Igb2JqZGlyLi4uIC5saWJzCmNoZWNraW5nIGlmIGdjYyAg
c3VwcG9ydHMgLWZuby1ydHRpIC1mbm8tZXhjZXB0aW9ucy4uLiBubwpjaGVja2luZyBmb3IgZ2Nj
ICBvcHRpb24gdG8gcHJvZHVjZSBQSUMuLi4gLWZQSUMgLURQSUMKY2hlY2tpbmcgaWYgZ2NjICBQ
SUMgZmxhZyAtZlBJQyAtRFBJQyB3b3Jrcy4uLiB5ZXMKY2hlY2tpbmcgaWYgZ2NjICBzdGF0aWMg
ZmxhZyAtc3RhdGljIHdvcmtzLi4uIHllcwpjaGVja2luZyBpZiBnY2MgIHN1cHBvcnRzIC1jIC1v
IGZpbGUuby4uLiB5ZXMKY2hlY2tpbmcgaWYgZ2NjICBzdXBwb3J0cyAtYyAtbyBmaWxlLm8uLi4g
KGNhY2hlZCkgeWVzCmNoZWNraW5nIHdoZXRoZXIgdGhlIGdjYyAgbGlua2VyIChsZCAgLW0gZWxm
X3g4Nl82NCkgc3VwcG9ydHMgc2hhcmVkIGxpYnJhcmllcy4uLiB5ZXMKY2hlY2tpbmcgd2hldGhl
ciAtbGMgc2hvdWxkIGJlIGV4cGxpY2l0bHkgbGlua2VkIGluLi4uIG5vCmNoZWNraW5nIGR5bmFt
aWMgbGlua2VyIGNoYXJhY3RlcmlzdGljcy4uLiBHTlUvTGludXggbGQuc28KY2hlY2tpbmcgaG93
IHRvIGhhcmRjb2RlIGxpYnJhcnkgcGF0aHMgaW50byBwcm9ncmFtcy4uLiBpbW1lZGlhdGUKY2hl
Y2tpbmcgd2hldGhlciBzdHJpcHBpbmcgbGlicmFyaWVzIGlzIHBvc3NpYmxlLi4uIHllcwpjaGVj
a2luZyBpZiBsaWJ0b29sIHN1cHBvcnRzIHNoYXJlZCBsaWJyYXJpZXMuLi4geWVzCmNoZWNraW5n
IHdoZXRoZXIgdG8gYnVpbGQgc2hhcmVkIGxpYnJhcmllcy4uLiB5ZXMKY2hlY2tpbmcgd2hldGhl
ciB0byBidWlsZCBzdGF0aWMgbGlicmFyaWVzLi4uIHllcwpjaGVja2luZyBob3cgdG8gcnVuIHRo
ZSBDKysgcHJlcHJvY2Vzc29yLi4uIGcrKyAgLUUKY2hlY2tpbmcgZm9yIGxkIHVzZWQgYnkgZysr
IC4uLiBsZCAgLW0gZWxmX3g4Nl82NApjaGVja2luZyBpZiB0aGUgbGlua2VyIChsZCAgLW0gZWxm
X3g4Nl82NCkgaXMgR05VIGxkLi4uIHllcwpjaGVja2luZyB3aGV0aGVyIHRoZSBnKysgIGxpbmtl
ciAobGQgIC1tIGVsZl94ODZfNjQpIHN1cHBvcnRzIHNoYXJlZCBsaWJyYXJpZXMuLi4geWVzCmNo
ZWNraW5nIGZvciBnKysgIG9wdGlvbiB0byBwcm9kdWNlIFBJQy4uLiAtZlBJQyAtRFBJQwpjaGVj
a2luZyBpZiBnKysgIFBJQyBmbGFnIC1mUElDIC1EUElDIHdvcmtzLi4uIHllcwpjaGVja2luZyBp
ZiBnKysgIHN0YXRpYyBmbGFnIC1zdGF0aWMgd29ya3MuLi4geWVzCmNoZWNraW5nIGlmIGcrKyAg
c3VwcG9ydHMgLWMgLW8gZmlsZS5vLi4uIHllcwpjaGVja2luZyBpZiBnKysgIHN1cHBvcnRzIC1j
IC1vIGZpbGUuby4uLiAoY2FjaGVkKSB5ZXMKY2hlY2tpbmcgd2hldGhlciB0aGUgZysrICBsaW5r
ZXIgKGxkICAtbSBlbGZfeDg2XzY0KSBzdXBwb3J0cyBzaGFyZWQgbGlicmFyaWVzLi4uIHllcwpj
aGVja2luZyBkeW5hbWljIGxpbmtlciBjaGFyYWN0ZXJpc3RpY3MuLi4gKGNhY2hlZCkgR05VL0xp
bnV4IGxkLnNvCmNoZWNraW5nIGhvdyB0byBoYXJkY29kZSBsaWJyYXJ5IHBhdGhzIGludG8gcHJv
Z3JhbXMuLi4gaW1tZWRpYXRlCmNvbmZpZ3VyZTogYnVpbGRpbmcgYm90aCBzaGFyZWQgYW5kIHN0
YXRpYyBsaWJyYXJpZXMKY2hlY2tpbmcgd2hldGhlciBsaWJ0b29sIG5lZWRzIC1uby11bmRlZmlu
ZWQuLi4gbm8KY2hlY2tpbmcgd2hldGhlciB0byBhdm9pZCBjaXJjdWxhciBsaW5rYWdlIGF0IGFs
bCBjb3N0cy4uLiBubwpjaGVja2luZyBmb3IgdHJhbmcuLi4gbm9uZQpjaGVja2luZyBmb3IgZG94
eWdlbi4uLiBub25lCmNoZWNraW5nIGZvciBFeHBhdC4uLiB5ZXMKY2hlY2tpbmcgZm9yIHNvY2tl
dCBpbiAtbHNvY2tldC4uLiBubwpjaGVja2luZyB3aGV0aGVyIHRvIGxvb2sgZm9yIFNBU0wuLi4g
bm8KY2hlY2tpbmcgZm9yIE1hY2gtTyBkeW5hbWljIG1vZHVsZSBpdGVyYXRpb24gZnVuY3Rpb25z
Li4uIG5vCmNoZWNraW5nIGZvciBNYWMgT1MgcHJvcGVydHkgbGlzdCB1dGlsaXRpZXMuLi4gbm8K
Y2hlY2tpbmcgZm9yIE1hYyBPUyBLZXlDaGFpbiBTZXJ2aWNlcy4uLiBjaGVja2luZyB3aGV0aGVy
IEFQUiBoYXMgc3VwcG9ydCBmb3IgRFNPcy4uLiB5ZXMKY2hlY2tpbmcgZm9yIEQtQnVzIC5wYyBm
aWxlLi4uIHllcwpjaGVja2luZyBELUJ1cyB2ZXJzaW9uLi4uIDEuOC4xNgpjaGVja2luZyBmb3Ig
RC1CdXMuLi4geWVzCmNoZWNraW5nIHdoZXRoZXIgdG8gc3VwcG9ydCBHUEctQWdlbnQuLi4geWVz
CmNoZWNraW5nIHdoZXRoZXIgdG8gbG9vayBmb3IgR05PTUUgS2V5cmluZy4uLiBubwpjaGVja2lu
ZyBtYWdpYy5oIHVzYWJpbGl0eS4uLiB5ZXMKY2hlY2tpbmcgbWFnaWMuaCBwcmVzZW5jZS4uLiB5
ZXMKY2hlY2tpbmcgZm9yIG1hZ2ljLmguLi4geWVzCmNoZWNraW5nIGZvciBtYWdpY19vcGVuIGlu
IC1sbWFnaWMuLi4geWVzCmNoZWNraW5nIHdoZXRoZXIgdG8gbG9vayBmb3IgS1dhbGxldC4uLiBu
bwpjaGVja2luZyBmb3IgQU5TSSBDIGhlYWRlciBmaWxlcy4uLiAoY2FjaGVkKSB5ZXMKY2hlY2tp
bmcgZm9yIGFuIEFOU0kgQy1jb25mb3JtaW5nIGNvbnN0Li4uIHllcwpjaGVja2luZyBmb3Igc2l6
ZV90Li4uIHllcwpjaGVja2luZyBmb3Igd29ya2luZyBtZW1jbXAuLi4gKGNhY2hlZCkgeWVzCmNo
ZWNraW5nIGZvciB2cHJpbnRmLi4uIHllcwpjaGVja2luZyBmb3IgX2RvcHJudC4uLiBubwpjaGVj
a2luZyBmb3Igc3ltbGluay4uLiB5ZXMKY2hlY2tpbmcgZm9yIHJlYWRsaW5rLi4uIHllcwpjaGVj
a2luZyBzeXMvdXRzbmFtZS5oIHVzYWJpbGl0eS4uLiB5ZXMKY2hlY2tpbmcgc3lzL3V0c25hbWUu
aCBwcmVzZW5jZS4uLiB5ZXMKY2hlY2tpbmcgZm9yIHN5cy91dHNuYW1lLmguLi4geWVzCmNoZWNr
aW5nIGZvciB1bmFtZS4uLiB5ZXMKY2hlY2tpbmcgdGVybWlvcy5oIHVzYWJpbGl0eS4uLiB5ZXMK
Y2hlY2tpbmcgdGVybWlvcy5oIHByZXNlbmNlLi4uIHllcwpjaGVja2luZyBmb3IgdGVybWlvcy5o
Li4uIHllcwpjaGVja2luZyBmb3IgdGNnZXRhdHRyLi4uIHllcwpjaGVja2luZyBmb3IgdGNzZXRh
dHRyLi4uIHllcwpjaGVja2luZyBmb3IgLVdsLC0tbm8tdW5kZWZpbmVkLi4uIHllcwpjb25maWd1
cmU6IEMgY29tcGlsZXIgZmxhZ3M6IC1pc3lzdGVtL2hvbWUvamFjay9Xb3JrL29lLWNvcmUuZ2l0
L3Rlc3QtYnVpbGQvdG1wLWdsaWJjL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvaW5jbHVkZSAt
TzIgLXBpcGUgICAtcHRocmVhZApjb25maWd1cmU6ICAgICB1c2VyLWRlZmluZWQ6IC1pc3lzdGVt
L2hvbWUvamFjay9Xb3JrL29lLWNvcmUuZ2l0L3Rlc3QtYnVpbGQvdG1wLWdsaWJjL3N5c3Jvb3Rz
L3g4Nl82NC1saW51eC91c3IvaW5jbHVkZSAtTzIgLXBpcGUKY29uZmlndXJlOiAgbWFpbnRhaW5l
ci1tb2RlOiAKY29uZmlndXJlOiBDKysgY29tcGlsZXIgZmxhZ3M6IC1pc3lzdGVtL2hvbWUvamFj
ay9Xb3JrL29lLWNvcmUuZ2l0L3Rlc3QtYnVpbGQvdG1wLWdsaWJjL3N5c3Jvb3RzL3g4Nl82NC1s
aW51eC91c3IvaW5jbHVkZSAtTzIgLXBpcGUKY29uZmlndXJlOiAgICAgICB1c2VyLWRlZmluZWQ6
IC1pc3lzdGVtL2hvbWUvamFjay9Xb3JrL29lLWNvcmUuZ2l0L3Rlc3QtYnVpbGQvdG1wLWdsaWJj
L3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvaW5jbHVkZSAtTzIgLXBpcGUKY29uZmlndXJlOiAg
ICBtYWludGFpbmVyLW1vZGU6IApjaGVja2luZyB6bGliLmggdXNhYmlsaXR5Li4uIHllcwpjaGVj
a2luZyB6bGliLmggcHJlc2VuY2UuLi4geWVzCmNoZWNraW5nIGZvciB6bGliLmguLi4geWVzCmNo
ZWNraW5nIGZvciBpbmZsYXRlIGluIC1sei4uLiB5ZXMKY2hlY2tpbmcgZm9yIHB5dGhvbi4uLiAv
aG9tZS9qYWNrL1dvcmsvb2UtY29yZS5naXQvdGVzdC1idWlsZC90bXAtZ2xpYmMvc3lzcm9vdHMv
eDg2XzY0LWxpbnV4L3Vzci9iaW4vcHl0aG9uLW5hdGl2ZS9weXRob24KY2hlY2tpbmcgZm9yIEpE
Sy4uLiBubwpjaGVja2luZyBmb3IgcGVybC4uLiAvdXNyL2Jpbi9wZXJsCmNoZWNraW5nIGZvciBy
dWJ5Li4uIChjYWNoZWQpIG5vbmUKY29uZmlndXJlOiBDb25maWd1cmluZyBweXRob24gc3dpZyBi
aW5kaW5nCmNoZWNraW5nIGZvciBQeXRob24gaW5jbHVkZXMuLi4gVHJhY2ViYWNrIChtb3N0IHJl
Y2VudCBjYWxsIGxhc3QpOgogIEZpbGUgIi9ob21lL2phY2svV29yay9vZS1jb3JlLmdpdC90ZXN0
LWJ1aWxkL3RtcC1nbGliYy93b3JrL3g4Nl82NC1saW51eC9zdWJ2ZXJzaW9uLW5hdGl2ZS8xLjgu
MTMtcjAvc3VidmVyc2lvbi0xLjguMTMvYnVpbGQvZ2V0LXB5LWluZm8ucHkiLCBsaW5lIDQ3LCBp
biA8bW9kdWxlPgogICAgZnJvbSBkaXN0dXRpbHMgaW1wb3J0IHN5c2NvbmZpZwogIEZpbGUgIi9o
b21lL2phY2svV29yay9vZS1jb3JlLmdpdC90ZXN0LWJ1aWxkL3RtcC1nbGliYy9zeXNyb290cy94
ODZfNjQtbGludXgvdXNyL2xpYi9weXRob24yLjcvZGlzdHV0aWxzL3N5c2NvbmZpZy5weSIsIGxp
bmUgMjIsIGluIDxtb2R1bGU+CiAgICBQUkVGSVggPSBvcy5wYXRoLm5vcm1wYXRoKHN5cy5wcmVm
aXgpLnJlcGxhY2UoIG9zLmdldGVudigiQlVJTERfU1lTIiksIG9zLmdldGVudigiSE9TVF9TWVMi
KSApClR5cGVFcnJvcjogZXhwZWN0ZWQgYSBjaGFyYWN0ZXIgYnVmZmVyIG9iamVjdAoKY2hlY2tp
bmcgZm9yIGNvbXBpbGluZyBQeXRob24gZXh0ZW5zaW9ucy4uLiBUcmFjZWJhY2sgKG1vc3QgcmVj
ZW50IGNhbGwgbGFzdCk6CiAgRmlsZSAiL2hvbWUvamFjay9Xb3JrL29lLWNvcmUuZ2l0L3Rlc3Qt
YnVpbGQvdG1wLWdsaWJjL3dvcmsveDg2XzY0LWxpbnV4L3N1YnZlcnNpb24tbmF0aXZlLzEuOC4x
My1yMC9zdWJ2ZXJzaW9uLTEuOC4xMy9idWlsZC9nZXQtcHktaW5mby5weSIsIGxpbmUgNDcsIGlu
IDxtb2R1bGU+CiAgICBmcm9tIGRpc3R1dGlscyBpbXBvcnQgc3lzY29uZmlnCiAgRmlsZSAiL2hv
bWUvamFjay9Xb3JrL29lLWNvcmUuZ2l0L3Rlc3QtYnVpbGQvdG1wLWdsaWJjL3N5c3Jvb3RzL3g4
Nl82NC1saW51eC91c3IvbGliL3B5dGhvbjIuNy9kaXN0dXRpbHMvc3lzY29uZmlnLnB5IiwgbGlu
ZSAyMiwgaW4gPG1vZHVsZT4KICAgIFBSRUZJWCA9IG9zLnBhdGgubm9ybXBhdGgoc3lzLnByZWZp
eCkucmVwbGFjZSggb3MuZ2V0ZW52KCJCVUlMRF9TWVMiKSwgb3MuZ2V0ZW52KCJIT1NUX1NZUyIp
ICkKVHlwZUVycm9yOiBleHBlY3RlZCBhIGNoYXJhY3RlciBidWZmZXIgb2JqZWN0CgpjaGVja2lu
ZyBmb3IgbGlua2luZyBQeXRob24gZXh0ZW5zaW9ucy4uLiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50
IGNhbGwgbGFzdCk6CiAgRmlsZSAiL2hvbWUvamFjay9Xb3JrL29lLWNvcmUuZ2l0L3Rlc3QtYnVp
bGQvdG1wLWdsaWJjL3dvcmsveDg2XzY0LWxpbnV4L3N1YnZlcnNpb24tbmF0aXZlLzEuOC4xMy1y
MC9zdWJ2ZXJzaW9uLTEuOC4xMy9idWlsZC9nZXQtcHktaW5mby5weSIsIGxpbmUgNDcsIGluIDxt
b2R1bGU+CiAgICBmcm9tIGRpc3R1dGlscyBpbXBvcnQgc3lzY29uZmlnCiAgRmlsZSAiL2hvbWUv
amFjay9Xb3JrL29lLWNvcmUuZ2l0L3Rlc3QtYnVpbGQvdG1wLWdsaWJjL3N5c3Jvb3RzL3g4Nl82
NC1saW51eC91c3IvbGliL3B5dGhvbjIuNy9kaXN0dXRpbHMvc3lzY29uZmlnLnB5IiwgbGluZSAy
MiwgaW4gPG1vZHVsZT4KICAgIFBSRUZJWCA9IG9zLnBhdGgubm9ybXBhdGgoc3lzLnByZWZpeCku
cmVwbGFjZSggb3MuZ2V0ZW52KCJCVUlMRF9TWVMiKSwgb3MuZ2V0ZW52KCJIT1NUX1NZUyIpICkK
VHlwZUVycm9yOiBleHBlY3RlZCBhIGNoYXJhY3RlciBidWZmZXIgb2JqZWN0CgpjaGVja2luZyBm
b3IgbGlua2luZyBQeXRob24gbGlicmFyaWVzLi4uIFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2Fs
bCBsYXN0KToKICBGaWxlICIvaG9tZS9qYWNrL1dvcmsvb2UtY29yZS5naXQvdGVzdC1idWlsZC90
bXAtZ2xpYmMvd29yay94ODZfNjQtbGludXgvc3VidmVyc2lvbi1uYXRpdmUvMS44LjEzLXIwL3N1
YnZlcnNpb24tMS44LjEzL2J1aWxkL2dldC1weS1pbmZvLnB5IiwgbGluZSA0NywgaW4gPG1vZHVs
ZT4KICAgIGZyb20gZGlzdHV0aWxzIGltcG9ydCBzeXNjb25maWcKICBGaWxlICIvaG9tZS9qYWNr
L1dvcmsvb2UtY29yZS5naXQvdGVzdC1idWlsZC90bXAtZ2xpYmMvc3lzcm9vdHMveDg2XzY0LWxp
bnV4L3Vzci9saWIvcHl0aG9uMi43L2Rpc3R1dGlscy9zeXNjb25maWcucHkiLCBsaW5lIDIyLCBp
biA8bW9kdWxlPgogICAgUFJFRklYID0gb3MucGF0aC5ub3JtcGF0aChzeXMucHJlZml4KS5yZXBs
YWNlKCBvcy5nZXRlbnYoIkJVSUxEX1NZUyIpLCBvcy5nZXRlbnYoIkhPU1RfU1lTIikgKQpUeXBl
RXJyb3I6IGV4cGVjdGVkIGEgY2hhcmFjdGVyIGJ1ZmZlciBvYmplY3QKCmNoZWNraW5nIGZvciBh
cHJfaW50NjRfdCBQeXRob24vQyBBUEkgZm9ybWF0IHN0cmluZy4uLiAKY29uZmlndXJlOiBlcnJv
cjogZmFpbGVkIHRvIHJlY29nbml6ZSBBUFJfSU5UNjRfVF9GTVQgb24gdGhpcyBwbGF0Zm9ybQpD
b25maWd1cmUgZmFpbGVkLiBUaGUgY29udGVudHMgb2YgYWxsIGNvbmZpZy5sb2cgZmlsZXMgZm9s
bG93cyB0byBhaWQgZGVidWdnaW5nCkVSUk9SOiBvZV9ydW5jb25mIGZhaWxlZApXQVJOSU5HOiAv
aG9tZS9qYWNrL1dvcmsvb2UtY29yZS5naXQvdGVzdC1idWlsZC90bXAtZ2xpYmMvd29yay94ODZf
NjQtbGludXgvc3VidmVyc2lvbi1uYXRpdmUvMS44LjEzLXIwL3RlbXAvcnVuLmRvX2NvbmZpZ3Vy
ZS4yODI1MDoxIGV4aXQgMSBmcm9tCiAgZXhpdCAxCkVSUk9SOiBGdW5jdGlvbiBmYWlsZWQ6IGRv
X2NvbmZpZ3VyZSAobG9nIGZpbGUgaXMgbG9jYXRlZCBhdCAvaG9tZS9qYWNrL1dvcmsvb2UtY29y
ZS5naXQvdGVzdC1idWlsZC90bXAtZ2xpYmMvd29yay94ODZfNjQtbGludXgvc3VidmVyc2lvbi1u
YXRpdmUvMS44LjEzLXIwL3RlbXAvbG9nLmRvX2NvbmZpZ3VyZS4yODI1MCkK

--------------030802070706020000070608
Content-Type: text/x-log;
 name="config.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="config.log"

This file contains any messages produced by compilers while
running configure, to aid debugging if configure makes a mistake.

It was created by subversion configure 1.8.13, which was
generated by GNU Autoconf 2.69.  Invocation command line was

  $ /home/jack/Work/oe-core.git/test-build/tmp-glibc/work/x86_64-linux/subv=
ersion-native/1.8.13-r0/subversion-1.8.13/configure --build=3Dx86_64-linux =
--host=3Dx86_64-linux --target=3Dx86_64-linux --prefix=3D/home/jack/Work/oe=
-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr --exec_prefix=3D/h=
ome/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr --=
bindir=3D/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-l=
inux/usr/bin --sbindir=3D/home/jack/Work/oe-core.git/test-build/tmp-glibc/s=
ysroots/x86_64-linux/usr/sbin --libexecdir=3D/home/jack/Work/oe-core.git/te=
st-build/tmp-glibc/sysroots/x86_64-linux/usr/lib/subversion --datadir=3D/ho=
me/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/sha=
re --sysconfdir=3D/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/etc --sharedstatedir=3D/home/jack/Work/oe-core.git/test-build=
/tmp-glibc/sysroots/x86_64-linux/com --localstatedir=3D/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/var --libdir=3D/home/jac=
k/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib --inc=
ludedir=3D/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-=
linux/usr/include --oldincludedir=3D/home/jack/Work/oe-core.git/test-build/=
tmp-glibc/sysroots/x86_64-linux/usr/include --infodir=3D/home/jack/Work/oe-=
core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/share/info --mandir=
=3D/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/u=
sr/share/man --disable-silent-rules --disable-dependency-tracking --without=
-berkeley-db --without-apxs --without-swig --with-apr=3D/home/jack/Work/oe-=
core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/bin --with-apr-util=
=3D/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/u=
sr/bin --disable-keychain ac_cv_path_RUBY=3Dnone --disable-nls --without-gn=
ome-keyring --without-sasl

## --------- ##
## Platform. ##
## --------- ##

hostname =3D arch-omg
uname -m =3D x86_64
uname -r =3D 4.0.5-1-ARCH
uname -s =3D Linux
uname -v =3D #1 SMP PREEMPT Sat Jun 6 18:37:49 CEST 2015

/usr/bin/uname -p =3D unknown
/bin/uname -X     =3D unknown

/bin/arch              =3D unknown
/usr/bin/arch -k       =3D unknown
/usr/convex/getsysinfo =3D unknown
/usr/bin/hostinfo      =3D unknown
/bin/machine           =3D unknown
/usr/bin/oslevel       =3D unknown
/bin/universe          =3D unknown

PATH: /home/jack/Work/oe-core.git/scripts/native-intercept
PATH: /home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linu=
x/usr/bin/python-native
PATH: /home/jack/Work/oe-core.git/scripts
PATH: /home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linu=
x/usr/bin/x86_64-linux
PATH: /home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linu=
x/usr/bin
PATH: /home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linu=
x/usr/sbin
PATH: /home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linu=
x/usr/bin
PATH: /home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linu=
x/sbin
PATH: /home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linu=
x/bin
PATH: /home/jack/Work/oe-core.git/scripts
PATH: /home/jack/Work/oe-core.git/bitbake/bin
PATH: /home/jack/Work/oe-core.git/bin
PATH: /usr/local/sbin
PATH: /usr/local/bin
PATH: /usr/bin
PATH: /usr/lib/jvm/default/bin
PATH: /usr/bin/site_perl
PATH: /usr/bin/vendor_perl
PATH: /usr/bin/core_perl


## ----------- ##
## Core tests. ##
## ----------- ##

configure:2538: loading site script /home/jack/Work/oe-core.git/meta/site/e=
ndian-little
| ac_cv_c_littleendian=3D${ac_cv_c_littleendian=3Dyes}
| ac_cv_c_bigendian=3D${ac_cv_c_bigendian=3Dno}
|=20
| # libnet
| ac_cv_libnet_endianess=3D${ac_cv_libnet_endianess=3Dlil}
|=20
| # libmemcached
| ac_cv_c_endian=3Dlittle
configure:2538: loading site script /home/jack/Work/oe-core.git/meta/site/c=
ommon-linux
| # apr
| ac_cv_file__dev_zero=3D${ac_cv_file__dev_zero=3Dyes}
| ac_cv_sizeof_pid_t=3D${ac_cv_sizeof_pid_t=3D4}
|=20
| # samba
| samba_cv_HAVE_IFACE_AIX=3D${samba_cv_HAVE_IFACE_AIX=3Dno}
| samba_cv_HAVE_IFACE_IFCONF=3D${samba_cv_HAVE_IFACE_IFCONF=3Dyes}
| samba_cv_HAVE_IFACE_IFREQ=3D${samba_cv_HAVE_IFACE_IFREQ=3Dyes}
| samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=3D${samba_cv_HAVE_IRIX_SPECIFIC_=
CAPABILITIES=3Dno}
|=20
| # db
| db_cv_path_ar=3D${db_cv_path_ar=3D/usr/bin/ar}
| db_cv_path_chmod=3D${db_cv_path_chmod=3D/bin/chmod}
| db_cv_path_cp=3D${db_cv_path_cp=3D/bin/cp}
| db_cv_path_ln=3D${db_cv_path_ln=3D/bin/ln}
| db_cv_path_mkdir=3D${db_cv_path_mkdir=3D/bin/mkdir}
| db_cv_path_ranlib=3D${db_cv_path_ranlib=3D/usr/bin/ranlib}
| db_cv_path_rm=3D${db_cv_path_rm=3D/bin/rm}
| db_cv_path_sh=3D${db_cv_path_sh=3D/bin/sh}
| db_cv_path_strip=3D${db_cv_path_strip=3D/usr/bin/strip}
|=20
| # bash
| bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
| bash_cv_must_reinstall_sighandlers=3D${bash_cv_must_reinstall_sighandlers=
=3Dno}
| bash_cv_func_strcoll_broken=3D${bash_cv_func_strcoll_broken=3Dno}
| bash_cv_dup2_broken=3D${bash_cv_dup2_broken=3Dno}
| bash_cv_opendir_not_robust=3D${bash_cv_opendir_not_robust=3Dno}
| bash_cv_type_rlimit=3D${bash_cv_type_rlimit=3Drlim_t}
| bash_cv_getenv_redef=3D${bash_cv_getenv_redef=3Dyes}
| bash_cv_ulimit_maxfds=3D${bash_cv_ulimit_maxfds=3Dyes}
| bash_cv_getcwd_calls_popen=3D${bash_cv_getcwd_calls_popen=3Dno}
| bash_cv_printf_a_format=3D${bash_cv_printf_a_format=3Dyes}
| bash_cv_pgrp_pipe=3D${bash_cv_pgrp_pipe=3Dno}
| bash_cv_job_control_missing=3D${bash_cv_job_control_missing=3Dpresent}
| bash_cv_sys_named_pipes=3D${bash_cv_sys_named_pipes=3Dpresent}
| bash_cv_unusable_rtsigs=3D${bash_cv_unusable_rtsigs=3Dno}
|=20
| # coreutils
| gl_cv_func_fstatat_zero_flag=3D${gl_cv_func_fstatat_zero_flag=3Dyes}
|=20
| # mysql
| ac_cv_sys_restartable_syscalls=3D${ac_cv_sys_restartable_syscalls=3Dyes}
| ac_cv_conv_longlong_to_float=3D${ac_cv_conv_longlong_to_float=3Dyes}
|=20
| # TCL
| tcl_cv_api_serial=3D${tcl_cv_api_serial=3Dtermios}
|=20
| # python
| ac_cv_have_long_long_format=3Dyes
|=20
| # apache
| ac_cv_o_nonblock_inherited=3D${ac_cv_o_nonblock_inherited=3Dno}
configure:2538: loading site script /home/jack/Work/oe-core.git/meta/site/c=
ommon-glibc
| # general
| ac_cv_have_decl_sys_siglist=3D${ac_cv_have_decl_sys_siglist=3Dyes}
| ac_cv_func_realloc_works=3D${ac_cv_func_realloc_works=3Dyes}
| ac_cv_func_realloc_0_nonnull=3D${ac_cv_func_realloc_0_nonnull=3Dyes}
| ac_cv_func_malloc_works=3D${ac_cv_func_malloc_works=3Dyes}
| ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_nonnull=3Dyes}
| ac_cv_func_memcmp_working=3D${ac_cv_func_memcmp_working=3Dyes}
| ac_cv_func_getpgrp_void=3Dyes
| ac_cv_func_setpgrp_void=3Dyes
| ac_cv_func_setgrent_void=3Dyes
| ac_cv_func_getgrgid_r=3D${ac_cv_func_getgrgid_r=3Dyes}
| ac_cv_func_getpwuid_r=3D${ac_cv_func_getpwuid_r=3Dyes}
| ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
| ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dyes}
| ac_cv_type_uid_t=3D{ac_cv_type_uid_t=3Dyes}
| ac_cv_func_getaddrinfo=3D${ac_cv_func_getaddrinfo=3Dyes}
|=20
| # bash
| bash_cv_under_sys_siglist=3D${bash_cv_under_sys_siglist=3Dyes}
| bash_cv_sys_siglist=3D${bash_cv_sys_siglist=3Dyes}
|=20
| # clamav
| clamav_av_func_working_snprintf_long=3D${clamav_av_func_working_snprintf_=
long=3Dyes}
| clamav_av_have_in_port_t=3D${clamav_av_have_in_port_t=3Dyes}
| clamav_av_have_in_addr_t=3D${clamav_av_have_in_addr_t=3Dyes}
| ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_mapped=3Dyes}
|=20
| # coreutils
| fu_cv_sys_stat_statfs2_bsize=3D${fu_cv_sys_stat_statfs2_bsize=3Dyes}
|=20
| # glib
| glib_cv_strlcpy=3D${glib_cv_strlcpy=3Dno}
| ac_cv_func_printf_unix98=3D${ac_cv_func_printf_unix98=3Dyes}
| ac_cv_func_snprintf_c99=3D${ac_cv_func_snprintf_c99=3Dyes}
| ac_cv_func_vsnprintf_c99=3D${ac_cv_func_vsnprintf_c99=3Dyes}
| glib_cv_compliant_posix_memalign=3D${glib_cv_compliant_posix_memalign=3D1=
}
| glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
| # glib-1.x requires this and pkgconfig-native / pkgconfig-nativesdk use
| # that to avoid a dependency loop.
| glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
| glib_cv_va_copy=3D${glib_cv_va_copy=3Dyes}
| glib_cv_have_qsort_r=3D${glib_cv_have_qsort_r=3Dyes}
|=20
| #dbus-glib
| ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
|=20
| # gnucash
| am_cv_scanf_lld=3D${am_cv_scanf_lld=3Dyes}
|=20
| # guile
| ac_cv_func_pthread_attr_getstack=3D${ac_cv_func_pthread_attr_getstack=3Dy=
es}
|=20
| #gcc-zlib
| ac_cv_func_getpagesize=3D${ac_cv_func_getpagesize=3Dyes}
| ac_cv_func_memcpy=3D${ac_cv_func_memcpy=3Dyes}
| ac_cv_func_strerror=3D${ac_cv_func_strerror=3Dyes}
|=20
| # squid
| ac_cv_af_unix_large_dgram=3D${ac_cv_af_unix_large_dgram=3Dyes}
| ac_cv_func_setresuid=3D${ac_cv_func_setresuid=3Dyes}
| ac_cv_func_va_copy=3D${ac_cv_func_va_copy=3Dyes}
| ac_cv_func___va_copy=3D${ac_cv_func___va_copy=3Dyes}
| ac_cv_epoll_works=3D${ac_cv_epoll_works=3Dyes}
|=20
| ac_cv_check_sjlj=3Dssjlj
|=20
| # m4
| gt_cv_locale_fr=3D${gt_cv_locale_fr=3Dfr_FR}
| gl_cv_func_btowc_eof=3D${gl_cv_func_btowc_eof=3Dyes}
| gl_cv_func_wcrtomb_retval=3D${gl_cv_func_wcrtomb_retval=3Dyes}
| gl_cv_func_wctob_works=3D${gl_cv_func_wctob_works=3Dyes}
| gl_cv_func_mbrtowc_incomplete_state=3D${gl_cv_func_mbrtowc_incomplete_sta=
te=3Dyes}
| gl_cv_func_mbrtowc_sanitycheck=3D${gl_cv_func_mbrtowc_sanitycheck=3Dyes}
| gl_cv_func_mbrtowc_null_arg=3D${gl_cv_func_mbrtowc_null_arg=3Dyes}
| gl_cv_func_mbrtowc_retval=3D${gl_cv_func_mbrtowc_retval=3Dyes}
| gl_cv_func_mbrtowc_nul_retval=3D${gl_cv_func_mbrtowc_nul_retval=3Dyes}
|=20
| # va_copy and _va_copy
| ac_cv_va_copy=3D${ac_cv_va_copy=3Dyes}
| ac_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
| ac_cv_func_va_copy=3D${ac_cv_func_va_copy=3Dyes}
| ac_cv_func___va_copy=3D${ac_cv_func___va_copy=3Dyes}
|=20
| # Xorg
| xorg_cv_malloc0_returns_null=3D${xorg_cv_malloc0_returns_null=3Dyes}
configure:2538: loading site script /home/jack/Work/oe-core.git/meta/site/x=
86_64-linux
| # general
| ac_cv_va_val_copy=3D${ac_cv_va_val_copy=3Dno}
| ac_cv_func_lstat_dereferences_slashed_symlink=3D${ac_cv_func_lstat_derefe=
rences_slashed_symlink=3Dyes}
| ac_cv_func_lstat_empty_string_bug=3D${ac_cv_func_lstat_empty_string_bug=
=3Dno}
| ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
| ac_cv_func_setvbuf_reversed=3D${ac_cv_func_setvbuf_reversed=3Dno}
| ac_cv_func_stat_empty_string_bug=3D${ac_cv_func_stat_empty_string_bug=3Dn=
o}
| ac_cv_func_stat_ignores_trailing_slash=3D${ac_cv_func_stat_ignores_traili=
ng_slash=3Dno}
| ac_libnet_have_packet_socket=3D${ac_libnet_have_packet_socket=3Dyes}
| ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
| ac_cv_need_trio=3D${ac_cv_need_trio=3Dno}
| ac_cv_sizeof_char=3D${ac_cv_sizeof_char=3D1}
| ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
| ac_cv_sizeof_unsigned_int=3D${ac_cv_sizeof_unsigned_int=3D4}
| ac_cv_sizeof___int64=3D${ac_cv_sizeof___int64=3D0}
| ac_cv_sizeof_long=3D${ac_cv_sizeof_long=3D8}
| ac_cv_sizeof_unsigned_long=3D${ac_cv_sizeof_unsigned_long=3D8}
| ac_cv_sizeof_long_double=3D${ac_cv_sizeof_long_double=3D16}
| ac_cv_sizeof_long_int=3D${ac_cv_sizeof_long_int=3D8}
| ac_cv_sizeof_long_long=3D${ac_cv_sizeof_long_long=3D8}
| ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D8}
| ac_cv_sizeof_short=3D${ac_cv_sizeof_short=3D2}
| ac_cv_sizeof_unsigned_short=3D${ac_cv_sizeof_unsigned_short=3D2}
| ac_cv_sizeof_short_int=3D${ac_cv_sizeof_short_int=3D2}
| ac_cv_sizeof_size_t=3D${ac_cv_sizeof_size_t=3D8}
| ac_cv_sizeof_uid_t=3D${ac_cv_sizeof_uid_t=3D4}
| ac_cv_sizeof_gid_t=3D${ac_cv_sizeof_gid_t=3D4}
| ac_cv_sizeof_ino_t=3D${ac_cv_sizeof_ino_t=3D8}
| ac_cv_sizeof_dev_t=3D${ac_cv_sizeof_dev_t=3D8}
| ac_cv_sizeof_void_p=3D${ac_cv_sizeof_void_p=3D8}
| ac_cv_strerror_r_SUSv3=3D${ac_cv_strerror_r_SUSv3=3Dno}
| db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long long'}
| db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
| db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
| db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
|=20
| # glib
| glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
| glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
| glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
| glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
| glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dyes}
| glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
| glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D40}
| glib_cv_sizeof_intmax_t=3D${glib_cv_sizeof_intmax_t=3D8}
| glib_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D8}
| glib_cv_sizeof_size_t=3D${glib_cv_sizeof_size_t=3D8}
| glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D8}
| glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
| glib_cv_sys_pthread_cond_timedwait_posix=3D${glib_cv_sys_pthread_cond_tim=
edwait_posix=3Dyes}
| glib_cv_sys_pthread_getspecific_posix=3D${glib_cv_sys_pthread_getspecific=
_posix=3Dyes}
| glib_cv_sys_pthread_mutex_trylock_posix=3D${glib_cv_sys_pthread_mutex_try=
lock_posix=3Dyes}
| glib_cv_uscore=3D${glib_cv_uscore=3Dno}
| glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dno}
| ac_cv_alignof_guint32=3D4
| ac_cv_alignof_guint64=3D8
| ac_cv_alignof_unsigned_long=3D8
|=20
| nano_cv_func_regexec_segv_emptystr=3D${nano_cv_func_regexec_segv_emptystr=
=3Dno}
| samba_cv_HAVE_VA_COPY=3D${samba_cv_HAVE_VA_COPY=3Dyes}
| screen_cv_sys_bcopy_overlap=3D${screen_cv_sys_bcopy_overlap=3Dno}
| screen_cv_sys_fifo_broken_impl=3D${screen_cv_sys_fifo_broken_impl=3Dyes}
| screen_cv_sys_fifo_usable=3D${screen_cv_sys_fifo_usable=3Dyes}
| screen_cv_sys_memcpy_overlap=3D${screen_cv_sys_memcpy_overlap=3Dno}
| screen_cv_sys_memmove_overlap=3D${screen_cv_sys_memmove_overlap=3Dno}
| screen_cv_sys_select_broken_retval=3D${screen_cv_sys_select_broken_retval=
=3Dno}
| screen_cv_sys_sockets_nofs=3D${screen_cv_sys_sockets_nofs=3Dno}
| screen_cv_sys_sockets_usable=3D${screen_cv_sys_sockets_usable=3Dyes}
| screen_cv_sys_terminfo_used=3D${screen_cv_sys_terminfo_used=3Dyes}
| utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
|=20
| # gettext
| am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
|=20
| #gcc
| ac_cv_lib_m_sin=3D${ac_cv_lib_m_sin=3Dyes}
|=20
| #orbit
| libIDL_cv_long_long_format=3Dll
|=20
| # bash
| bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dpresent}
|=20
| # ORBit2
| ac_cv_alignof_CORBA_boolean=3D1
| ac_cv_alignof_CORBA_char=3D1
| ac_cv_alignof_CORBA_double=3D8
| ac_cv_alignof_CORBA_float=3D4
| ac_cv_alignof_CORBA_long=3D4
| ac_cv_alignof_CORBA_long_double=3D8
| ac_cv_alignof_CORBA_long_long=3D8
| ac_cv_alignof_CORBA_octet=3D1
| ac_cv_alignof_CORBA_pointer=3D8
| ac_cv_alignof_CORBA_short=3D2
| ac_cv_alignof_CORBA_struct=3D1
| ac_cv_alignof_CORBA_wchar=3D2
|=20
| lf_cv_sane_realloc=3Dyes
| as_cv_unaligned_access=3D${as_cv_unaligned_access=3Dyes}
|=20
| #unfs3
| nfsd_cv_broken_setfsuid=3D${nfsd_cv_broken_setfsuid=3D0}
| nfsd_cv_func_statfs=3D${nfsd_cv_func_statfs=3Dstatfs2_bsize}
| nfsd_cv_bsd_signals=3D${nfsd_cv_bsd_signals=3Dyes}
|=20
| #apr
| apr_cv_tcp_nodelay_with_cork=3D${apr_cv_tcp_nodelay_with_cork=3Dyes}
|=20
| # lftp
| lftp_cv_va_val_copy=3D${lftp_cv_va_val_copy=3Dno}
|=20
| # slrn
| slrn_cv_va_val_copy=3D${slrn_cv_va_val_copy=3Dno}
|=20
| # grub
| ac_cv_func___ashldi3=3Dno
| ac_cv_func___ashrdi3=3Dno
| ac_cv_func___bswapdi2=3Dno
| ac_cv_func___bswapsi2=3Dno
| ac_cv_func___lshrdi3=3Dno
| ac_cv_func___trampoline_setup=3Dno
| ac_cv_func___ucmpdi2=3Dno
| ac_cv_func__restgpr_14_x=3Dno
|=20
| # cvs
| cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=3Dyes}
|=20
| # at-spi2-core
| ac_cv_alignof_char=3D1
| ac_cv_alignof_dbind_pointer=3D8
| ac_cv_alignof_dbind_struct=3D1
| ac_cv_alignof_dbus_bool_t=3D4
| ac_cv_alignof_dbus_int16_t=3D2
| ac_cv_alignof_dbus_int32_t=3D4
| ac_cv_alignof_dbus_int64_t=3D8
| ac_cv_alignof_double=3D8
configure:2538: loading site script /home/jack/Work/oe-core.git/meta/site/c=
ommon
| # libelf
| mr_cv_target_elf=3D${mr_cv_target_elf=3Dyes}
|=20
| # Normally kernels have /dev/random enabled
| ac_cv_file__dev_random=3D${ac_cv_file__dev_random=3Dyes}
|=20
| # Avoid sudo to assume void for unsetenv in cross environment, or else it=
 conflicts with
| # target stdlib.h prototype which follows POSIX compiliance. Mark for ups=
tream.
| sudo_cv_func_unsetenv_void=3Dno
|=20
| # shadow dir info, to avoid searching build system
| shadow_cv_maildir=3D${localstatedir}/spool/mail
| shadow_cv_mailfile=3DMailbox
| shadow_cv_utmpdir=3D${localstatedir}/run
| shadow_cv_logdir=3D${localstatedir}/log
| shadow_cv_passwd_dir=3D${bindir}
|=20
| # python: deactivate a runtime check for ipv6-support in python >=3D2.7.1=
 that fails when cross-compiling
| ac_cv_buggy_getaddrinfo=3Dno
|=20
| ac_cv_path_SED=3Dsed
configure:2538: loading site script /home/jack/Work/oe-core.git/test-build/=
tmp-glibc/work/x86_64-linux/subversion-native/1.8.13-r0/build/aclocal-copy/=
ncurses_config
| ac_cv_header_X=3D${ac_cv_header_X=3Dno}
| ac_cv_header__CC=3D${ac_cv_header__CC=3Dno}
| ac_cv_header__CFLAGS=3D${ac_cv_header__CFLAGS=3Dno}
| ac_cv_header__CPPFLAGS=3D${ac_cv_header__CPPFLAGS=3Dno}
| ac_cv_header___5=3D${ac_cv_header___5=3Dno}
| ac_cv_header__c=3D${ac_cv_header__c=3Dno}
| ac_cv_header_conftest__ac_ext=3D${ac_cv_header_conftest__ac_ext=3Dno}
| ac_cv_header_curses_h=3D${ac_cv_header_curses_h=3Dyes}
| ac_cv_header_inttypes_h=3D${ac_cv_header_inttypes_h=3Dyes}
| ac_cv_header_memory_h=3D${ac_cv_header_memory_h=3Dyes}
| ac_cv_header_ncurses_curses_h=3D${ac_cv_header_ncurses_curses_h=3Dyes}
| ac_cv_header_ncurses_h=3D${ac_cv_header_ncurses_h=3Dyes}
| ac_cv_header_ncurses_termcap_h=3D${ac_cv_header_ncurses_termcap_h=3Dyes}
| ac_cv_header_stdc=3D${ac_cv_header_stdc=3Dyes}
| ac_cv_header_stdint_h=3D${ac_cv_header_stdint_h=3Dyes}
| ac_cv_header_stdlib_h=3D${ac_cv_header_stdlib_h=3Dyes}
| ac_cv_header_string_h=3D${ac_cv_header_string_h=3Dyes}
| ac_cv_header_strings_h=3D${ac_cv_header_strings_h=3Dyes}
| ac_cv_header_sys_stat_h=3D${ac_cv_header_sys_stat_h=3Dyes}
| ac_cv_header_sys_types_h=3D${ac_cv_header_sys_types_h=3Dyes}
| ac_cv_header_unistd_h=3D${ac_cv_header_unistd_h=3Dyes}
configure:2666: Configuring Subversion 1.8.13
configure:2685: creating config.nice
configure:2717: checking for x86_64-linux-gcc
configure:2744: result: gcc=20
configure:3013: checking for C compiler version
configure:3022: gcc  --version >&5
gcc (GCC) 5.1.0
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

configure:3033: $? =3D 0
configure:3022: gcc  -v >&5
Using built-in specs.
COLLECT_GCC=3Dgcc
COLLECT_LTO_WRAPPER=3D/usr/lib/gcc/x86_64-unknown-linux-gnu/5.1.0/lto-wrapp=
er
Target: x86_64-unknown-linux-gnu
Configured with: /build/gcc/src/gcc-5-20150519/configure --prefix=3D/usr --=
libdir=3D/usr/lib --libexecdir=3D/usr/lib --mandir=3D/usr/share/man --infod=
ir=3D/usr/share/info --with-bugurl=3Dhttps://bugs.archlinux.org/ --enable-l=
anguages=3Dc,c++,ada,fortran,go,lto,objc,obj-c++ --enable-shared --enable-t=
hreads=3Dposix --enable-libmpx --with-system-zlib --with-isl --enable-__cxa=
_atexit --disable-libunwind-exceptions --enable-clocale=3Dgnu --disable-lib=
stdcxx-pch --disable-libssp --enable-gnu-unique-object --enable-linker-buil=
d-id --enable-lto --enable-plugin --enable-install-libiberty --with-linker-=
hash-style=3Dgnu --enable-gnu-indirect-function --disable-multilib --disabl=
e-werror --enable-checking=3Drelease --with-default-libstdcxx-abi=3Dc++98
Thread model: posix
gcc version 5.1.0 (GCC)=20
configure:3033: $? =3D 0
configure:3022: gcc  -V >&5
gcc: error: unrecognized command line option '-V'
gcc: fatal error: no input files
compilation terminated.
configure:3033: $? =3D 1
configure:3022: gcc  -qversion >&5
gcc: error: unrecognized command line option '-qversion'
gcc: fatal error: no input files
compilation terminated.
configure:3033: $? =3D 1
configure:3053: checking whether the C compiler works
configure:3075: gcc  -isystem/home/jack/Work/oe-core.git/test-build/tmp-gli=
bc/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/include -L/home/jack=
/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/hom=
e/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,=
-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_6=
4-linux/usr/lib -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-=
glibc/sysroots/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test=
-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/o=
e-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1 conftest.=
c  >&5
configure:3079: $? =3D 0
configure:3127: result: yes
configure:3130: checking for C compiler default output file name
configure:3132: result: a.out
configure:3138: checking for suffix of executables
configure:3145: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-b=
uild/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/home/ja=
ck/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/include =
-L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/us=
r/lib -L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-li=
nux/lib -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sy=
sroots/x86_64-linux/usr/lib -Wl,-rpath-link,/home/jack/Work/oe-core.git/tes=
t-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home=
/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-=
O1 conftest.c  >&5
configure:3149: $? =3D 0
configure:3171: result:=20
configure:3193: checking whether we are cross compiling
configure:3201: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-b=
uild/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/home/ja=
ck/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/include =
-L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/us=
r/lib -L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-li=
nux/lib -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sy=
sroots/x86_64-linux/usr/lib -Wl,-rpath-link,/home/jack/Work/oe-core.git/tes=
t-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home=
/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-=
O1 conftest.c  >&5
configure:3205: $? =3D 0
configure:3212: ./conftest
configure:3216: $? =3D 0
configure:3231: result: no
configure:3236: checking for suffix of object files
configure:3258: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp-=
glibc/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/home/jack/Work/o=
e-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/include conftest.=
c >&5
configure:3262: $? =3D 0
configure:3283: result: o
configure:3287: checking whether we are using the GNU C compiler
configure:3306: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp-=
glibc/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/home/jack/Work/o=
e-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/include conftest.=
c >&5
configure:3306: $? =3D 0
configure:3315: result: yes
configure:3324: checking whether gcc  accepts -g
configure:3344: gcc  -c -g -isystem/home/jack/Work/oe-core.git/test-build/t=
mp-glibc/sysroots/x86_64-linux/usr/include conftest.c >&5
configure:3344: $? =3D 0
configure:3385: result: yes
configure:3402: checking for gcc  option to accept ISO C89
configure:3465: gcc   -c -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/home/jack/Work/=
oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/include conftest=
.c >&5
configure:3465: $? =3D 0
configure:3478: result: none needed
configure:3511: checking if gcc  accepts -std=3Dc90
configure:3518: gcc  -o conftest -std=3Dc90  -isystem/home/jack/Work/oe-cor=
e.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/include -L/home/jack/W=
ork/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/home/=
jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-r=
path-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-=
linux/usr/lib -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-gl=
ibc/sysroots/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-b=
uild/tmp-glibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-=
core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1 conftest.c =
 >&5
configure:3518: $? =3D 0
configure:3520: result: yes
configure:3633: checking if gcc  accepts -Werror=3Dunknown-warning-option
configure:3640: gcc  -o conftest -Werror=3Dunknown-warning-option -isystem/=
home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -isystem/home/jack/Work/oe-core.git/test-build/tmp-glibc/s=
ysroots/x86_64-linux/usr/include -L/home/jack/Work/oe-core.git/test-build/t=
mp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe-core.git/test-b=
uild/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/home/jack/Work/oe=
-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath-lin=
k,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/li=
b -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_=
64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-glib=
c/sysroots/x86_64-linux/lib -Wl,-O1 conftest.c  >&5
cc1: error: -Werror=3Dunknown-warning-option: no option -Wunknown-warning-o=
ption
configure:3640: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "subversion"
| #define PACKAGE_TARNAME "subversion"
| #define PACKAGE_VERSION "1.8.13"
| #define PACKAGE_STRING "subversion 1.8.13"
| #define PACKAGE_BUGREPORT "http://subversion.apache.org/"
| #define PACKAGE_URL ""
| /* end confdefs.h.  */
| int main(void){return 0;}
configure:3648: result: no
configure:3780: checking for C++ compiler version
configure:3789: g++  --version >&5
g++ (GCC) 5.1.0
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

configure:3800: $? =3D 0
configure:3789: g++  -v >&5
Using built-in specs.
COLLECT_GCC=3Dg++
COLLECT_LTO_WRAPPER=3D/usr/lib/gcc/x86_64-unknown-linux-gnu/5.1.0/lto-wrapp=
er
Target: x86_64-unknown-linux-gnu
Configured with: /build/gcc/src/gcc-5-20150519/configure --prefix=3D/usr --=
libdir=3D/usr/lib --libexecdir=3D/usr/lib --mandir=3D/usr/share/man --infod=
ir=3D/usr/share/info --with-bugurl=3Dhttps://bugs.archlinux.org/ --enable-l=
anguages=3Dc,c++,ada,fortran,go,lto,objc,obj-c++ --enable-shared --enable-t=
hreads=3Dposix --enable-libmpx --with-system-zlib --with-isl --enable-__cxa=
_atexit --disable-libunwind-exceptions --enable-clocale=3Dgnu --disable-lib=
stdcxx-pch --disable-libssp --enable-gnu-unique-object --enable-linker-buil=
d-id --enable-lto --enable-plugin --enable-install-libiberty --with-linker-=
hash-style=3Dgnu --enable-gnu-indirect-function --disable-multilib --disabl=
e-werror --enable-checking=3Drelease --with-default-libstdcxx-abi=3Dc++98
Thread model: posix
gcc version 5.1.0 (GCC)=20
configure:3800: $? =3D 0
configure:3789: g++  -V >&5
g++: error: unrecognized command line option '-V'
g++: fatal error: no input files
compilation terminated.
configure:3800: $? =3D 1
configure:3789: g++  -qversion >&5
g++: error: unrecognized command line option '-qversion'
g++: fatal error: no input files
compilation terminated.
configure:3800: $? =3D 1
configure:3804: checking whether we are using the GNU C++ compiler
configure:3823: g++  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp-=
glibc/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/home/jack/Work/o=
e-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/include conftest.=
cpp >&5
configure:3823: $? =3D 0
configure:3832: result: yes
configure:3841: checking whether g++  accepts -g
configure:3861: g++  -c -g -isystem/home/jack/Work/oe-core.git/test-build/t=
mp-glibc/sysroots/x86_64-linux/usr/include conftest.cpp >&5
configure:3861: $? =3D 0
configure:3902: result: yes
configure:3938: checking if g++  accepts -std=3Dc++98
configure:3945: g++  -o conftest -std=3Dc++98  -isystem/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/include -L/home/jack=
/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/hom=
e/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,=
-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_6=
4-linux/usr/lib -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-=
glibc/sysroots/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test=
-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/o=
e-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1 conftest.=
cpp  >&5
configure:3945: $? =3D 0
configure:3947: result: yes
configure:3982: checking if g++  accepts -Werror=3Dunknown-warning-option
configure:3989: g++  -o conftest -Werror=3Dunknown-warning-option -isystem/=
home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -isystem/home/jack/Work/oe-core.git/test-build/tmp-glibc/s=
ysroots/x86_64-linux/usr/include -L/home/jack/Work/oe-core.git/test-build/t=
mp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe-core.git/test-b=
uild/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/home/jack/Work/oe=
-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath-lin=
k,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/li=
b -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_=
64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-glib=
c/sysroots/x86_64-linux/lib -Wl,-O1 conftest.cpp  >&5
cc1plus: error: -Werror=3Dunknown-warning-option: no option -Wunknown-warni=
ng-option
configure:3989: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "subversion"
| #define PACKAGE_TARNAME "subversion"
| #define PACKAGE_VERSION "1.8.13"
| #define PACKAGE_STRING "subversion 1.8.13"
| #define PACKAGE_BUGREPORT "http://subversion.apache.org/"
| #define PACKAGE_URL ""
| /* end confdefs.h.  */
| int main(){}
configure:3997: result: no
configure:4020: checking how to run the C preprocessor
configure:4090: result: gcc  -E
configure:4110: gcc  -E -isystem/home/jack/Work/oe-core.git/test-build/tmp-=
glibc/sysroots/x86_64-linux/usr/include conftest.c
configure:4110: $? =3D 0
configure:4124: gcc  -E -isystem/home/jack/Work/oe-core.git/test-build/tmp-=
glibc/sysroots/x86_64-linux/usr/include conftest.c
conftest.c:9:28: fatal error: ac_nonexistent.h: No such file or directory
compilation terminated.
configure:4124: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "subversion"
| #define PACKAGE_TARNAME "subversion"
| #define PACKAGE_VERSION "1.8.13"
| #define PACKAGE_STRING "subversion 1.8.13"
| #define PACKAGE_BUGREPORT "http://subversion.apache.org/"
| #define PACKAGE_URL ""
| /* end confdefs.h.  */
| #include <ac_nonexistent.h>
configure:4155: checking for a sed that does not truncate output
configure:4219: result: sed
configure:4230: checking build system type
configure:4244: result: x86_64-pc-linux-gnu
configure:4264: checking host system type
configure:4277: result: x86_64-pc-linux-gnu
configure:4297: checking target system type
configure:4310: result: x86_64-pc-linux-gnu
configure:4339: checking for grep that handles long lines and -e
configure:4397: result: /usr/bin/grep
configure:4402: checking for egrep
configure:4464: result: /usr/bin/grep -E
configure:4470: checking whether ln -s works
configure:4474: result: yes
configure:4496: checking for a BSD-compatible install
configure:4564: result: /usr/bin/install -c
configure:4595: Apache Portable Runtime (APR) library configuration
configure:4623: checking for APR
configure:4699: result: yes
configure:4724: checking APR version
configure:4730: result: 1.5.2
configure:4844: Apache Portable Runtime Utility (APRUTIL) library configura=
tion
configure:4872: checking for APR-util
configure:4948: result: yes
configure:4969: checking APRUTIL version
configure:4983: result: 1.5.4
configure:5085: checking for pkg-config
configure:5103: found /home/jack/Work/oe-core.git/test-build/tmp-glibc/sysr=
oots/x86_64-linux/usr/bin/pkg-config
configure:5115: result: /home/jack/Work/oe-core.git/test-build/tmp-glibc/sy=
sroots/x86_64-linux/usr/bin/pkg-config
configure:5125: checking for ANSI C header files
configure:5229: result: yes
configure:5242: checking for sys/types.h
configure:5242: result: yes
configure:5242: checking for sys/stat.h
configure:5242: result: yes
configure:5242: checking for stdlib.h
configure:5242: result: yes
configure:5242: checking for string.h
configure:5242: result: yes
configure:5242: checking for memory.h
configure:5242: result: yes
configure:5242: checking for strings.h
configure:5242: result: yes
configure:5242: checking for inttypes.h
configure:5242: result: yes
configure:5242: checking for stdint.h
configure:5242: result: yes
configure:5242: checking for unistd.h
configure:5242: result: yes
configure:5425: serf library configuration via pkg-config
configure:5429: checking for serf-2 library
configure:5455: result: no
configure:5429: checking for serf-1 library
configure:5432: result: yes
configure:5434: checking serf library version
configure:5437: result: 1.3.8
configure:5439: checking serf version is suitable
configure:5442: result: yes
configure:5463: checking was serf enabled
configure:5466: result: yes
configure:5565: looking for apr_memcache as part of apr-util
configure:5569: checking apr_memcache.h usability
configure:5569: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp-=
glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home/=
jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/includ=
e   -DLINUX -D_REENTRANT -D_GNU_SOURCE  -I/home/jack/Work/oe-core.git/test-=
build/tmp-glibc/sysroots/x86_64-linux/usr/include   -I/home/jack/Work/oe-co=
re.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/include -I/home/jack/=
Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/include con=
ftest.c >&5
configure:5569: $? =3D 0
configure:5569: result: yes
configure:5569: checking apr_memcache.h presence
configure:5569: gcc  -E -isystem/home/jack/Work/oe-core.git/test-build/tmp-=
glibc/sysroots/x86_64-linux/usr/include   -DLINUX -D_REENTRANT -D_GNU_SOURC=
E  -I/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux=
/usr/include   -I/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/=
x86_64-linux/usr/include -I/home/jack/Work/oe-core.git/test-build/tmp-glibc=
/sysroots/x86_64-linux/usr/include conftest.c
configure:5569: $? =3D 0
configure:5569: result: yes
configure:5569: checking for apr_memcache.h
configure:5569: result: yes
configure:5574: checking for apr_memcache_create in -laprutil-1
configure:5599: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-b=
uild/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isys=
tem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/u=
sr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE  -I/home/jack/Work/oe-core.=
git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/include   -I/home/jack/W=
ork/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/include -I/h=
ome/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/in=
clude -L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-li=
nux/usr/lib -L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86=
_64-linux/lib -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-gl=
ibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/home/jack/Work/oe-core.g=
it/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath,/home/jack/Wor=
k/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath=
,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib=
 -Wl,-O1  -L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_6=
4-linux/usr/lib -L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/usr/lib -laprutil-1 conftest.c -laprutil-1   >&5
configure:5599: $? =3D 0
configure:5608: result: yes
configure:5654: checking for Apache module support via DSO through APXS
configure:5724: result: no
configure:5887: checking sqlite library
configure:6338: checking sqlite amalgamation
configure:6341: result: no
configure:6630: checking sqlite amalgamation
configure:6633: result: no
configure:6938: checking sqlite3.h usability
configure:6938: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp-=
glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home/=
jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/includ=
e   -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
configure:6938: $? =3D 0
configure:6938: result: yes
configure:6938: checking sqlite3.h presence
configure:6938: gcc  -E -isystem/home/jack/Work/oe-core.git/test-build/tmp-=
glibc/sysroots/x86_64-linux/usr/include   -DLINUX -D_REENTRANT -D_GNU_SOURC=
E conftest.c
configure:6938: $? =3D 0
configure:6938: result: yes
configure:6938: checking for sqlite3.h
configure:6938: result: yes
configure:6941: checking sqlite library version (via header)
configure:6953: result: okay
configure:6955: checking for sqlite3_close in -lsqlite3
configure:6980: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-b=
uild/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isys=
tem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/u=
sr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE -L/home/jack/Work/oe-core.g=
it/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe-=
core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/ho=
me/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib=
 -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/=
x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-glib=
c/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test=
-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1  -L/home/jack/Work/oe-co=
re.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib conftest.c -lsqli=
te3   >&5
configure:6980: $? =3D 0
configure:6989: result: yes
configure:7137: checking whether the compiler provides atomic builtins
configure:7184: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-b=
uild/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isys=
tem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/u=
sr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE -L/home/jack/Work/oe-core.g=
it/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe-=
core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/ho=
me/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib=
 -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/=
x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-glib=
c/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test=
-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1  -L/home/jack/Work/oe-co=
re.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib conftest.c  >&5
configure:7184: $? =3D 0
configure:7184: ./conftest
configure:7184: $? =3D 0
configure:7194: result: yes
configure:7252: configuring libtool now
configure:7300: checking how to print strings
configure:7327: result: printf
configure:7348: checking for a sed that does not truncate output
configure:7412: result: sed
configure:7430: checking for fgrep
configure:7492: result: /usr/bin/grep -F
configure:7527: checking for ld used by gcc=20
configure:7594: result: ld=20
configure:7601: checking if the linker (ld ) is GNU ld
configure:7616: result: yes
configure:7628: checking for BSD- or MS-compatible name lister (nm)
configure:7682: result: nm
configure:7812: checking the name lister (nm) interface
configure:7819: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp-=
glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home/=
jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/includ=
e   -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
configure:7822: nm "conftest.o"
configure:7825: output
0000000000000000 B some_variable
configure:7832: result: BSD nm
configure:7836: checking the maximum length of command line arguments
configure:7967: result: 1572864
configure:8015: checking how to convert x86_64-pc-linux-gnu file names to x=
86_64-pc-linux-gnu format
configure:8055: result: func_convert_file_noop
configure:8062: checking how to convert x86_64-pc-linux-gnu file names to t=
oolchain format
configure:8082: result: func_convert_file_noop
configure:8089: checking for ld  option to reload object files
configure:8096: result: -r
configure:8130: checking for x86_64-linux-objdump
configure:8157: result: objdump
configure:8229: checking how to recognize dependent libraries
configure:8429: result: pass_all
configure:8474: checking for x86_64-linux-dlltool
configure:8504: result: no
configure:8514: checking for dlltool
configure:8544: result: no
configure:8574: checking how to associate runtime and link libraries
configure:8601: result: printf %s\n
configure:8617: checking for x86_64-linux-ar
configure:8644: result: ar
configure:8725: checking for archiver @FILE support
configure:8742: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp-=
glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home/=
jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/includ=
e   -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
configure:8742: $? =3D 0
configure:8745: ar cru libconftest.a @conftest.lst >&5
configure:8748: $? =3D 0
configure:8753: ar cru libconftest.a @conftest.lst >&5
ar: conftest.o: No such file or directory
configure:8756: $? =3D 1
configure:8768: result: @
configure:8786: checking for x86_64-linux-strip
configure:8813: result: strip
configure:8885: checking for x86_64-linux-ranlib
configure:8912: result: ranlib
configure:9029: checking for gawk
configure:9045: found /usr/bin/gawk
configure:9056: result: gawk
configure:9096: checking command to parse nm output from gcc  object
configure:9249: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp-=
glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home/=
jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/includ=
e   -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
configure:9252: $? =3D 0
configure:9256: nm conftest.o \| sed -n -e 's/^.*[ ]\([ABCDGIRSTW][ABCDGIRS=
TW]*\)[ ][ ]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p' | sed '/ __gnu_lto/d' =
\> conftest.nm
configure:9259: $? =3D 0
configure:9325: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-b=
uild/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isys=
tem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/u=
sr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE -L/home/jack/Work/oe-core.g=
it/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe-=
core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/ho=
me/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib=
 -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/=
x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-glib=
c/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test=
-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1  -L/home/jack/Work/oe-co=
re.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib conftest.c confts=
tm.o >&5
configure:9328: $? =3D 0
configure:9366: result: ok
configure:9413: checking for sysroot
configure:9448: result: no
configure:9455: checking for a working dd
configure:9493: result: /usr/bin/dd
configure:9497: checking how to truncate binary pipes
configure:9512: result: /usr/bin/dd bs=3D4096 count=3D1
configure:9648: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp-=
glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home/=
jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/includ=
e   -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
configure:9651: $? =3D 0
configure:9801: checking for x86_64-linux-mt
configure:9831: result: no
configure:9841: checking for mt
configure:9871: result: no
configure:9891: checking if : is a manifest tool
configure:9897: : '-?'
configure:9905: result: no
configure:10579: checking for dlfcn.h
configure:10579: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home=
/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/inclu=
de   -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
configure:10579: $? =3D 0
configure:10579: result: yes
configure:10846: checking for objdir
configure:10861: result: .libs
configure:11121: checking if gcc  supports -fno-rtti -fno-exceptions
configure:11139: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home=
/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/inclu=
de   -DLINUX -D_REENTRANT -D_GNU_SOURCE -fno-rtti -fno-exceptions conftest.=
c >&5
cc1: warning: command line option '-fno-rtti' is valid for C++/ObjC++ but n=
ot for C
configure:11143: $? =3D 0
configure:11156: result: no
configure:11514: checking for gcc  option to produce PIC
configure:11521: result: -fPIC -DPIC
configure:11529: checking if gcc  PIC flag -fPIC -DPIC works
configure:11547: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home=
/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/inclu=
de   -DLINUX -D_REENTRANT -D_GNU_SOURCE -fPIC -DPIC -DPIC conftest.c >&5
configure:11551: $? =3D 0
configure:11564: result: yes
configure:11593: checking if gcc  static flag -static works
configure:11621: result: yes
configure:11636: checking if gcc  supports -c -o file.o
configure:11657: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home=
/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/inclu=
de   -DLINUX -D_REENTRANT -D_GNU_SOURCE -o out/conftest2.o conftest.c >&5
configure:11661: $? =3D 0
configure:11683: result: yes
configure:11691: checking if gcc  supports -c -o file.o
configure:11738: result: yes
configure:11771: checking whether the gcc  linker (ld  -m elf_x86_64) suppo=
rts shared libraries
configure:13030: result: yes
configure:13067: checking whether -lc should be explicitly linked in
configure:13075: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home=
/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/inclu=
de   -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
configure:13078: $? =3D 0
configure:13093: gcc  -shared  -fPIC -DPIC conftest.o  -v -Wl,-soname -Wl,c=
onftest -o conftest 2\>\&1 \| /usr/bin/grep  -lc  \>/dev/null 2\>\&1
configure:13096: $? =3D 0
configure:13110: result: no
configure:13270: checking dynamic linker characteristics
configure:13851: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-=
build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isy=
stem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/=
usr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE -L/home/jack/Work/oe-core.=
git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe=
-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/h=
ome/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-gli=
bc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/tes=
t-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1  -L/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath -Wl,/=
foo conftest.c  >&5
configure:13851: $? =3D 0
configure:14088: result: GNU/Linux ld.so
configure:14210: checking how to hardcode library paths into programs
configure:14235: result: immediate
configure:14783: checking whether stripping libraries is possible
configure:14788: result: yes
configure:14823: checking if libtool supports shared libraries
configure:14825: result: yes
configure:14828: checking whether to build shared libraries
configure:14853: result: yes
configure:14856: checking whether to build static libraries
configure:14860: result: yes
configure:14883: checking how to run the C++ preprocessor
configure:14910: g++  -E -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include   -DLINUX -D_REENTRANT -D_GNU_SOUR=
CE conftest.cpp
configure:14910: $? =3D 0
configure:14924: g++  -E -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include   -DLINUX -D_REENTRANT -D_GNU_SOUR=
CE conftest.cpp
conftest.cpp:27:28: fatal error: ac_nonexistent.h: No such file or director=
y
compilation terminated.
configure:14924: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "subversion"
| #define PACKAGE_TARNAME "subversion"
| #define PACKAGE_VERSION "1.8.13"
| #define PACKAGE_STRING "subversion 1.8.13"
| #define PACKAGE_BUGREPORT "http://subversion.apache.org/"
| #define PACKAGE_URL ""
| #define SVN_SOVERSION 0
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define SVN_HAVE_SERF 1
| #define SVN_HAVE_MEMCACHE 1
| #define SVN_HAS_ATOMIC_BUILTINS 1
| #define SVN_BINDIR "/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysr=
oots/x86_64-linux/usr/bin"
| #define SVN_LOCALE_DIR "/home/jack/Work/oe-core.git/test-build/tmp-glibc/=
sysroots/x86_64-linux/usr/share/locale"
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| /* end confdefs.h.  */
| #include <ac_nonexistent.h>
configure:14949: result: g++  -E
configure:14969: g++  -E -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include   -DLINUX -D_REENTRANT -D_GNU_SOUR=
CE conftest.cpp
configure:14969: $? =3D 0
configure:14983: g++  -E -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include   -DLINUX -D_REENTRANT -D_GNU_SOUR=
CE conftest.cpp
conftest.cpp:27:28: fatal error: ac_nonexistent.h: No such file or director=
y
compilation terminated.
configure:14983: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "subversion"
| #define PACKAGE_TARNAME "subversion"
| #define PACKAGE_VERSION "1.8.13"
| #define PACKAGE_STRING "subversion 1.8.13"
| #define PACKAGE_BUGREPORT "http://subversion.apache.org/"
| #define PACKAGE_URL ""
| #define SVN_SOVERSION 0
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define SVN_HAVE_SERF 1
| #define SVN_HAVE_MEMCACHE 1
| #define SVN_HAS_ATOMIC_BUILTINS 1
| #define SVN_BINDIR "/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysr=
oots/x86_64-linux/usr/bin"
| #define SVN_LOCALE_DIR "/home/jack/Work/oe-core.git/test-build/tmp-glibc/=
sysroots/x86_64-linux/usr/share/locale"
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| /* end confdefs.h.  */
| #include <ac_nonexistent.h>
configure:15145: checking for ld used by g++=20
configure:15212: result: ld  -m elf_x86_64
configure:15219: checking if the linker (ld  -m elf_x86_64) is GNU ld
configure:15234: result: yes
configure:15289: checking whether the g++  linker (ld  -m elf_x86_64) suppo=
rts shared libraries
configure:16362: result: yes
configure:16398: g++  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/home/jack/Work/=
oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/include   -DLINU=
X -D_REENTRANT -D_GNU_SOURCE conftest.cpp >&5
configure:16401: $? =3D 0
configure:16882: checking for g++  option to produce PIC
configure:16889: result: -fPIC -DPIC
configure:16897: checking if g++  PIC flag -fPIC -DPIC works
configure:16915: g++  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/home/jack/Work/=
oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/include   -DLINU=
X -D_REENTRANT -D_GNU_SOURCE -fPIC -DPIC -DPIC conftest.cpp >&5
configure:16919: $? =3D 0
configure:16932: result: yes
configure:16955: checking if g++  static flag -static works
configure:16983: result: yes
configure:16995: checking if g++  supports -c -o file.o
configure:17016: g++  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/home/jack/Work/=
oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/include   -DLINU=
X -D_REENTRANT -D_GNU_SOURCE -o out/conftest2.o conftest.cpp >&5
configure:17020: $? =3D 0
configure:17042: result: yes
configure:17047: checking if g++  supports -c -o file.o
configure:17094: result: yes
configure:17124: checking whether the g++  linker (ld  -m elf_x86_64) suppo=
rts shared libraries
configure:17164: result: yes
configure:17305: checking dynamic linker characteristics
configure:18050: result: GNU/Linux ld.so
configure:18115: checking how to hardcode library paths into programs
configure:18140: result: immediate
configure:18244: building both shared and static libraries
configure:18300: checking whether libtool needs -no-undefined
configure:18309: result: no
configure:18316: checking whether to avoid circular linkage at all costs
configure:18327: result: no
configure:18344: checking for trang
configure:18375: result: none
configure:18400: checking for doxygen
configure:18431: result: none
configure:18461: checking for Expat
configure:18487: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-=
build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isy=
stem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/=
usr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE  -L/home/jack/Work/oe-core=
.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/o=
e-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/=
home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/l=
ib -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroot=
s/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-gl=
ibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/te=
st-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1  -L/home/jack/Work/oe-=
core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib conftest.c  -le=
xpat >&5
configure:18487: $? =3D 0
configure:18496: result: yes
configure:18546: checking for socket in -lsocket
configure:18571: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-=
build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isy=
stem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/=
usr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE -L/home/jack/Work/oe-core.=
git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe=
-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/h=
ome/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-gli=
bc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/tes=
t-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1  -L/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib conftest.c -lsoc=
ket   >&5
/usr/bin/ld: cannot find -lsocket
collect2: error: ld returned 1 exit status
configure:18571: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "subversion"
| #define PACKAGE_TARNAME "subversion"
| #define PACKAGE_VERSION "1.8.13"
| #define PACKAGE_STRING "subversion 1.8.13"
| #define PACKAGE_BUGREPORT "http://subversion.apache.org/"
| #define PACKAGE_URL ""
| #define SVN_SOVERSION 0
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define SVN_HAVE_SERF 1
| #define SVN_HAVE_MEMCACHE 1
| #define SVN_HAS_ATOMIC_BUILTINS 1
| #define SVN_BINDIR "/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysr=
oots/x86_64-linux/usr/bin"
| #define SVN_LOCALE_DIR "/home/jack/Work/oe-core.git/test-build/tmp-glibc/=
sysroots/x86_64-linux/usr/share/locale"
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| /* end confdefs.h.  */
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char socket ();
| int
| main ()
| {
| return socket ();
|   ;
|   return 0;
| }
configure:18580: result: no
configure:18887: checking whether to look for SASL
configure:18891: result: no
configure:19081: checking for Mach-O dynamic module iteration functions
configure:19083: result: no
configure:19087: checking for Mac OS property list utilities
configure:19089: result: no
configure:19101: checking for Mac OS KeyChain Services
configure:19145: checking whether APR has support for DSOs
configure:19157: gcc  -E -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include   -DLINUX -D_REENTRANT -D_GNU_SOUR=
CE  -I/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linu=
x/usr/include  conftest.c
configure:19157: $? =3D 0
configure:19159: result: yes
configure:19172: checking for D-Bus .pc file
configure:19175: result: yes
configure:19180: checking D-Bus version
configure:19183: result: 1.8.16
configure:19192: checking for D-Bus
configure:19201: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-=
build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isy=
stem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/=
usr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE -I/home/jack/Work/oe-core.=
git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/include/dbus-1.0 -I/home=
/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib/d=
bus-1.0/include -L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/usr/lib -L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sy=
sroots/x86_64-linux/lib -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-bu=
ild/tmp-glibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/home/jack/Work=
/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath,/hom=
e/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib =
-Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64=
-linux/lib -Wl,-O1  -L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysr=
oots/x86_64-linux/usr/lib conftest.c  -L/home/jack/Work/oe-core.git/test-bu=
ild/tmp-glibc/sysroots/x86_64-linux/usr/lib -ldbus-1 >&5
configure:19201: $? =3D 0
configure:19209: result: yes
configure:19232: checking whether to support GPG-Agent
configure:19235: result: yes
configure:19258: checking whether to look for GNOME Keyring
configure:19330: result: no
configure:19833: checking magic.h usability
configure:19833: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home=
/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/inclu=
de   -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
configure:19833: $? =3D 0
configure:19833: result: yes
configure:19833: checking magic.h presence
configure:19833: gcc  -E -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include   -DLINUX -D_REENTRANT -D_GNU_SOUR=
CE conftest.c
configure:19833: $? =3D 0
configure:19833: result: yes
configure:19833: checking for magic.h
configure:19833: result: yes
configure:19836: checking for magic_open in -lmagic
configure:19861: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-=
build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isy=
stem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/=
usr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE -L/home/jack/Work/oe-core.=
git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe=
-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/h=
ome/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-gli=
bc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/tes=
t-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1  -L/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib conftest.c -lmag=
ic   >&5
configure:19861: $? =3D 0
configure:19870: result: yes
configure:19928: checking whether to look for KWallet
configure:20093: result: no
configure:20164: checking for ANSI C header files
configure:20268: result: yes
configure:20278: checking for an ANSI C-conforming const
configure:20344: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home=
/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/inclu=
de   -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
configure:20344: $? =3D 0
configure:20351: result: yes
configure:20360: checking for size_t
configure:20360: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home=
/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/inclu=
de   -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
configure:20360: $? =3D 0
configure:20360: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home=
/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/inclu=
de   -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
conftest.c: In function 'main':
conftest.c:69:21: error: expected expression before ')' token
 if (sizeof ((size_t)))
                     ^
configure:20360: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "subversion"
| #define PACKAGE_TARNAME "subversion"
| #define PACKAGE_VERSION "1.8.13"
| #define PACKAGE_STRING "subversion 1.8.13"
| #define PACKAGE_BUGREPORT "http://subversion.apache.org/"
| #define PACKAGE_URL ""
| #define SVN_SOVERSION 0
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define SVN_HAVE_SERF 1
| #define SVN_HAVE_MEMCACHE 1
| #define SVN_HAS_ATOMIC_BUILTINS 1
| #define SVN_BINDIR "/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysr=
oots/x86_64-linux/usr/bin"
| #define SVN_LOCALE_DIR "/home/jack/Work/oe-core.git/test-build/tmp-glibc/=
sysroots/x86_64-linux/usr/share/locale"
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define SVN_FS_WANT_DB_MAJOR 4
| #define SVN_FS_WANT_DB_MINOR 0
| #define SVN_FS_WANT_DB_PATCH 14
| #define SVN_HAVE_GPG_AGENT 1
| #define SVN_HAVE_LIBMAGIC 1
| #define STDC_HEADERS 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| int
| main ()
| {
| if (sizeof ((size_t)))
| 	    return 0;
|   ;
|   return 0;
| }
configure:20360: result: yes
configure:20374: checking for working memcmp
configure:20427: result: yes
configure:20439: checking for vprintf
configure:20439: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-=
build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isy=
stem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/=
usr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE -L/home/jack/Work/oe-core.=
git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe=
-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/h=
ome/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-gli=
bc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/tes=
t-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1  -L/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib conftest.c  >&5
conftest.c:56:6: warning: conflicting types for built-in function 'vprintf'
 char vprintf ();
      ^
configure:20439: $? =3D 0
configure:20439: result: yes
configure:20445: checking for _doprnt
configure:20445: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-=
build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isy=
stem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/=
usr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE -L/home/jack/Work/oe-core.=
git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe=
-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/h=
ome/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-gli=
bc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/tes=
t-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1  -L/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib conftest.c  >&5
/tmp/ccbpcPYK.o: In function `main':
conftest.c:(.text.startup+0x7): undefined reference to `_doprnt'
collect2: error: ld returned 1 exit status
configure:20445: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "subversion"
| #define PACKAGE_TARNAME "subversion"
| #define PACKAGE_VERSION "1.8.13"
| #define PACKAGE_STRING "subversion 1.8.13"
| #define PACKAGE_BUGREPORT "http://subversion.apache.org/"
| #define PACKAGE_URL ""
| #define SVN_SOVERSION 0
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define SVN_HAVE_SERF 1
| #define SVN_HAVE_MEMCACHE 1
| #define SVN_HAS_ATOMIC_BUILTINS 1
| #define SVN_BINDIR "/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysr=
oots/x86_64-linux/usr/bin"
| #define SVN_LOCALE_DIR "/home/jack/Work/oe-core.git/test-build/tmp-glibc/=
sysroots/x86_64-linux/usr/share/locale"
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define SVN_FS_WANT_DB_MAJOR 4
| #define SVN_FS_WANT_DB_MINOR 0
| #define SVN_FS_WANT_DB_PATCH 14
| #define SVN_HAVE_GPG_AGENT 1
| #define SVN_HAVE_LIBMAGIC 1
| #define STDC_HEADERS 1
| #define HAVE_VPRINTF 1
| /* end confdefs.h.  */
| /* Define _doprnt to an innocuous variant, in case <limits.h> declares _d=
oprnt.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define _doprnt innocuous__doprnt
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char _doprnt (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef _doprnt
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char _doprnt ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub__doprnt || defined __stub____doprnt
| choke me
| #endif
|=20
| int
| main ()
| {
| return _doprnt ();
|   ;
|   return 0;
| }
configure:20445: result: no
configure:20460: checking for symlink
configure:20460: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-=
build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isy=
stem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/=
usr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE -L/home/jack/Work/oe-core.=
git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe=
-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/h=
ome/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-gli=
bc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/tes=
t-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1  -L/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib conftest.c  >&5
configure:20460: $? =3D 0
configure:20460: result: yes
configure:20460: checking for readlink
configure:20460: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-=
build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isy=
stem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/=
usr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE -L/home/jack/Work/oe-core.=
git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe=
-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/h=
ome/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-gli=
bc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/tes=
t-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1  -L/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib conftest.c  >&5
configure:20460: $? =3D 0
configure:20460: result: yes
configure:20472: checking sys/utsname.h usability
configure:20472: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home=
/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/inclu=
de   -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
configure:20472: $? =3D 0
configure:20472: result: yes
configure:20472: checking sys/utsname.h presence
configure:20472: gcc  -E -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include   -DLINUX -D_REENTRANT -D_GNU_SOUR=
CE conftest.c
configure:20472: $? =3D 0
configure:20472: result: yes
configure:20472: checking for sys/utsname.h
configure:20472: result: yes
configure:20479: checking for uname
configure:20479: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-=
build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isy=
stem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/=
usr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE -L/home/jack/Work/oe-core.=
git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe=
-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/h=
ome/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-gli=
bc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/tes=
t-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1  -L/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib conftest.c  >&5
configure:20479: $? =3D 0
configure:20479: result: yes
configure:20493: checking termios.h usability
configure:20493: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home=
/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/inclu=
de   -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
configure:20493: $? =3D 0
configure:20493: result: yes
configure:20493: checking termios.h presence
configure:20493: gcc  -E -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include   -DLINUX -D_REENTRANT -D_GNU_SOUR=
CE conftest.c
configure:20493: $? =3D 0
configure:20493: result: yes
configure:20493: checking for termios.h
configure:20493: result: yes
configure:20499: checking for tcgetattr
configure:20499: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-=
build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isy=
stem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/=
usr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE -L/home/jack/Work/oe-core.=
git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe=
-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/h=
ome/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-gli=
bc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/tes=
t-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1  -L/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib conftest.c  >&5
configure:20499: $? =3D 0
configure:20499: result: yes
configure:20499: checking for tcsetattr
configure:20499: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-=
build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isy=
stem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/=
usr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE -L/home/jack/Work/oe-core.=
git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe=
-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/h=
ome/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-gli=
bc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/tes=
t-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1  -L/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib conftest.c  >&5
configure:20499: $? =3D 0
configure:20499: result: yes
configure:20568: checking for -Wl,--no-undefined
configure:20576: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-=
build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isy=
stem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/=
usr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE -L/home/jack/Work/oe-core.=
git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe=
-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/h=
ome/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-gli=
bc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/tes=
t-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1  -L/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -Wl,--no-undefin=
ed conftest.c  >&5
configure:20576: $? =3D 0
configure:20585: result: yes
configure:22161: C compiler flags: -isystem/home/jack/Work/oe-core.git/test=
-build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread
configure:22163:     user-defined: -isystem/home/jack/Work/oe-core.git/test=
-build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe
configure:22165:  maintainer-mode:=20
configure:22167: C++ compiler flags: -isystem/home/jack/Work/oe-core.git/te=
st-build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe
configure:22169:       user-defined: -isystem/home/jack/Work/oe-core.git/te=
st-build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe
configure:22171:    maintainer-mode:=20
configure:22333: checking zlib.h usability
configure:22333: gcc  -c -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isystem/home=
/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/inclu=
de   -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
configure:22333: $? =3D 0
configure:22333: result: yes
configure:22333: checking zlib.h presence
configure:22333: gcc  -E -isystem/home/jack/Work/oe-core.git/test-build/tmp=
-glibc/sysroots/x86_64-linux/usr/include   -DLINUX -D_REENTRANT -D_GNU_SOUR=
CE conftest.c
configure:22333: $? =3D 0
configure:22333: result: yes
configure:22333: checking for zlib.h
configure:22333: result: yes
configure:22336: checking for inflate in -lz
configure:22361: gcc  -o conftest -isystem/home/jack/Work/oe-core.git/test-=
build/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread -isy=
stem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/=
usr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE -L/home/jack/Work/oe-core.=
git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe=
-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/h=
ome/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-gli=
bc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/tes=
t-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1  -L/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib conftest.c -lz  =
 >&5
configure:22361: $? =3D 0
configure:22370: result: yes
configure:22513: checking for python
configure:22531: found /home/jack/Work/oe-core.git/test-build/tmp-glibc/sys=
roots/x86_64-linux/usr/bin/python-native/python
configure:22543: result: /home/jack/Work/oe-core.git/test-build/tmp-glibc/s=
ysroots/x86_64-linux/usr/bin/python-native/python
configure:22898: checking for JDK
configure:22959: result: no
configure:23046: checking for perl
configure:23064: found /usr/bin/perl
configure:23077: result: /usr/bin/perl
configure:23133: checking for ruby
configure:23163: result: none
configure:23442: Configuring python swig binding
configure:23445: checking for Python includes
configure:23454: result:=20
configure:23463: checking for compiling Python extensions
configure:23472: result:=20
configure:23476: checking for linking Python extensions
configure:23485: result:=20
configure:23489: checking for linking Python libraries
configure:23498: result:=20
configure:23523: checking for apr_int64_t Python/C API format string
configure:23571: result:=20
configure:23575: error: failed to recognize APR_INT64_T_FMT on this platfor=
m

## ---------------- ##
## Cache variables. ##
## ---------------- ##

ac_cv___va_copy=3Dyes
ac_cv_af_unix_large_dgram=3Dyes
ac_cv_alignof_CORBA_boolean=3D1
ac_cv_alignof_CORBA_char=3D1
ac_cv_alignof_CORBA_double=3D8
ac_cv_alignof_CORBA_float=3D4
ac_cv_alignof_CORBA_long=3D4
ac_cv_alignof_CORBA_long_double=3D8
ac_cv_alignof_CORBA_long_long=3D8
ac_cv_alignof_CORBA_octet=3D1
ac_cv_alignof_CORBA_pointer=3D8
ac_cv_alignof_CORBA_short=3D2
ac_cv_alignof_CORBA_struct=3D1
ac_cv_alignof_CORBA_wchar=3D2
ac_cv_alignof_char=3D1
ac_cv_alignof_dbind_pointer=3D8
ac_cv_alignof_dbind_struct=3D1
ac_cv_alignof_dbus_bool_t=3D4
ac_cv_alignof_dbus_int16_t=3D2
ac_cv_alignof_dbus_int32_t=3D4
ac_cv_alignof_dbus_int64_t=3D8
ac_cv_alignof_double=3D8
ac_cv_alignof_guint32=3D4
ac_cv_alignof_guint64=3D8
ac_cv_alignof_unsigned_long=3D8
ac_cv_buggy_getaddrinfo=3Dno
ac_cv_build=3Dx86_64-pc-linux-gnu
ac_cv_c_bigendian=3Dno
ac_cv_c_compiler_gnu=3Dyes
ac_cv_c_const=3Dyes
ac_cv_c_endian=3Dlittle
ac_cv_c_littleendian=3Dyes
ac_cv_check_sjlj=3Dssjlj
ac_cv_conv_longlong_to_float=3Dyes
ac_cv_cxx_compiler_gnu=3Dyes
ac_cv_env_CCC_set=3D
ac_cv_env_CCC_value=3D
ac_cv_env_CC_set=3Dset
ac_cv_env_CC_value=3D'gcc '
ac_cv_env_CFLAGS_set=3Dset
ac_cv_env_CFLAGS_value=3D'-isystem/home/jack/Work/oe-core.git/test-build/tm=
p-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe'
ac_cv_env_CPPFLAGS_set=3Dset
ac_cv_env_CPPFLAGS_value=3D-isystem/home/jack/Work/oe-core.git/test-build/t=
mp-glibc/sysroots/x86_64-linux/usr/include
ac_cv_env_CPP_set=3Dset
ac_cv_env_CPP_value=3D'gcc  -E'
ac_cv_env_CXXCPP_set=3D
ac_cv_env_CXXCPP_value=3D
ac_cv_env_CXXFLAGS_set=3Dset
ac_cv_env_CXXFLAGS_value=3D'-isystem/home/jack/Work/oe-core.git/test-build/=
tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe'
ac_cv_env_CXX_set=3Dset
ac_cv_env_CXX_value=3D'g++ '
ac_cv_env_LDFLAGS_set=3Dset
ac_cv_env_LDFLAGS_value=3D'-L/home/jack/Work/oe-core.git/test-build/tmp-gli=
bc/sysroots/x86_64-linux/usr/lib -L/home/jack/Work/oe-core.git/test-build/t=
mp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/home/jack/Work/oe-core.=
git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/hom=
e/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,=
-rpath,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-lin=
ux/usr/lib -Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysr=
oots/x86_64-linux/lib -Wl,-O1'
ac_cv_env_LIBS_set=3D
ac_cv_env_LIBS_value=3D
ac_cv_env_LT_SYS_LIBRARY_PATH_set=3D
ac_cv_env_LT_SYS_LIBRARY_PATH_value=3D
ac_cv_env_build_alias_set=3Dset
ac_cv_env_build_alias_value=3Dx86_64-linux
ac_cv_env_host_alias_set=3Dset
ac_cv_env_host_alias_value=3Dx86_64-linux
ac_cv_env_target_alias_set=3Dset
ac_cv_env_target_alias_value=3Dx86_64-linux
ac_cv_epoll_works=3Dyes
ac_cv_file__dev_random=3Dyes
ac_cv_file__dev_zero=3Dyes
ac_cv_func___ashldi3=3Dno
ac_cv_func___ashrdi3=3Dno
ac_cv_func___bswapdi2=3Dno
ac_cv_func___bswapsi2=3Dno
ac_cv_func___lshrdi3=3Dno
ac_cv_func___trampoline_setup=3Dno
ac_cv_func___ucmpdi2=3Dno
ac_cv_func___va_copy=3Dyes
ac_cv_func__doprnt=3Dno
ac_cv_func__restgpr_14_x=3Dno
ac_cv_func_getaddrinfo=3Dyes
ac_cv_func_getgrgid_r=3Dyes
ac_cv_func_getpagesize=3Dyes
ac_cv_func_getpgrp_void=3Dyes
ac_cv_func_getpwuid_r=3Dyes
ac_cv_func_lstat_dereferences_slashed_symlink=3Dyes
ac_cv_func_lstat_empty_string_bug=3Dno
ac_cv_func_malloc_0_nonnull=3Dyes
ac_cv_func_malloc_works=3Dyes
ac_cv_func_memcmp_working=3Dyes
ac_cv_func_memcpy=3Dyes
ac_cv_func_mmap_fixed_mapped=3Dyes
ac_cv_func_posix_getgrgid_r=3Dyes
ac_cv_func_posix_getpwnam_r=3Dyes
ac_cv_func_posix_getpwuid_r=3Dyes
ac_cv_func_printf_unix98=3Dyes
ac_cv_func_pthread_attr_getstack=3Dyes
ac_cv_func_readlink=3Dyes
ac_cv_func_realloc_0_nonnull=3Dyes
ac_cv_func_realloc_works=3Dyes
ac_cv_func_setgrent_void=3Dyes
ac_cv_func_setpgrp_void=3Dyes
ac_cv_func_setresuid=3Dyes
ac_cv_func_setvbuf_reversed=3Dno
ac_cv_func_snprintf_c99=3Dyes
ac_cv_func_stat_empty_string_bug=3Dno
ac_cv_func_stat_ignores_trailing_slash=3Dno
ac_cv_func_strerror=3Dyes
ac_cv_func_symlink=3Dyes
ac_cv_func_tcgetattr=3Dyes
ac_cv_func_tcsetattr=3Dyes
ac_cv_func_uname=3Dyes
ac_cv_func_va_copy=3Dyes
ac_cv_func_vprintf=3Dyes
ac_cv_func_vsnprintf_c99=3Dyes
ac_cv_have_abstract_sockets=3Dyes
ac_cv_have_decl_sys_siglist=3Dyes
ac_cv_have_long_long_format=3Dyes
ac_cv_header_X=3Dno
ac_cv_header__CC=3Dno
ac_cv_header__CFLAGS=3Dno
ac_cv_header__CPPFLAGS=3Dno
ac_cv_header___5=3Dno
ac_cv_header__c=3Dno
ac_cv_header_apr_memcache_h=3Dyes
ac_cv_header_conftest__ac_ext=3Dno
ac_cv_header_curses_h=3Dyes
ac_cv_header_dlfcn_h=3Dyes
ac_cv_header_inttypes_h=3Dyes
ac_cv_header_magic_h=3Dyes
ac_cv_header_memory_h=3Dyes
ac_cv_header_ncurses_curses_h=3Dyes
ac_cv_header_ncurses_h=3Dyes
ac_cv_header_ncurses_termcap_h=3Dyes
ac_cv_header_sqlite3_h=3Dyes
ac_cv_header_stdc=3Dyes
ac_cv_header_stdint_h=3Dyes
ac_cv_header_stdlib_h=3Dyes
ac_cv_header_string_h=3Dyes
ac_cv_header_strings_h=3Dyes
ac_cv_header_sys_stat_h=3Dyes
ac_cv_header_sys_types_h=3Dyes
ac_cv_header_sys_utsname_h=3Dyes
ac_cv_header_termios_h=3Dyes
ac_cv_header_unistd_h=3Dyes
ac_cv_header_zlib_h=3Dyes
ac_cv_host=3Dx86_64-pc-linux-gnu
ac_cv_lib_aprutil_1_apr_memcache_create=3Dyes
ac_cv_lib_m_sin=3Dyes
ac_cv_lib_magic_magic_open=3Dyes
ac_cv_lib_socket_socket=3Dno
ac_cv_lib_sqlite3_sqlite3_close=3Dyes
ac_cv_lib_z_inflate=3Dyes
ac_cv_libnet_endianess=3Dlil
ac_cv_linux_vers=3D2
ac_cv_need_trio=3Dno
ac_cv_o_nonblock_inherited=3Dno
ac_cv_objext=3Do
ac_cv_path_DOXYGEN=3Dnone
ac_cv_path_EGREP=3D'/usr/bin/grep -E'
ac_cv_path_FGREP=3D'/usr/bin/grep -F'
ac_cv_path_GREP=3D/usr/bin/grep
ac_cv_path_PERL=3D/usr/bin/perl
ac_cv_path_PKG_CONFIG=3D/home/jack/Work/oe-core.git/test-build/tmp-glibc/sy=
sroots/x86_64-linux/usr/bin/pkg-config
ac_cv_path_PYTHON=3D/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroo=
ts/x86_64-linux/usr/bin/python-native/python
ac_cv_path_RUBY=3Dnone
ac_cv_path_SED=3Dsed
ac_cv_path_TRANG=3Dnone
ac_cv_path_install=3D'/usr/bin/install -c'
ac_cv_path_lt_DD=3D/usr/bin/dd
ac_cv_prog_AR=3Dar
ac_cv_prog_AWK=3Dgawk
ac_cv_prog_CC=3D'gcc '
ac_cv_prog_CPP=3D'gcc  -E'
ac_cv_prog_CXXCPP=3D'g++  -E'
ac_cv_prog_OBJDUMP=3Dobjdump
ac_cv_prog_RANLIB=3Dranlib
ac_cv_prog_STRIP=3Dstrip
ac_cv_prog_cc_c89=3D
ac_cv_prog_cc_g=3Dyes
ac_cv_prog_cxx_g=3Dyes
ac_cv_python_compile=3D
ac_cv_python_includes=3D
ac_cv_python_libs=3D
ac_cv_python_link=3D
ac_cv_sizeof___int64=3D0
ac_cv_sizeof_char=3D1
ac_cv_sizeof_dev_t=3D8
ac_cv_sizeof_gid_t=3D4
ac_cv_sizeof_ino_t=3D8
ac_cv_sizeof_int=3D4
ac_cv_sizeof_long=3D8
ac_cv_sizeof_long_double=3D16
ac_cv_sizeof_long_int=3D8
ac_cv_sizeof_long_long=3D8
ac_cv_sizeof_off_t=3D8
ac_cv_sizeof_pid_t=3D4
ac_cv_sizeof_short=3D2
ac_cv_sizeof_short_int=3D2
ac_cv_sizeof_size_t=3D8
ac_cv_sizeof_uid_t=3D4
ac_cv_sizeof_unsigned_int=3D4
ac_cv_sizeof_unsigned_long=3D8
ac_cv_sizeof_unsigned_short=3D2
ac_cv_sizeof_void_p=3D8
ac_cv_strerror_r_SUSv3=3Dno
ac_cv_sys_restartable_syscalls=3Dyes
ac_cv_target=3Dx86_64-pc-linux-gnu
ac_cv_type_size_t=3Dyes
ac_cv_type_uid_t=3D'{ac_cv_type_uid_t=3Dyes}'
ac_cv_va_copy=3Dyes
ac_cv_va_val_copy=3Dno
am_cv_func_working_getline=3Dyes
am_cv_scanf_lld=3Dyes
apr_cv_tcp_nodelay_with_cork=3Dyes
as_cv_unaligned_access=3Dyes
bash_cv_dup2_broken=3Dno
bash_cv_func_sigsetjmp=3Dpresent
bash_cv_func_strcoll_broken=3Dno
bash_cv_getcwd_calls_popen=3Dno
bash_cv_getenv_redef=3Dyes
bash_cv_have_mbstate_t=3Dyes
bash_cv_job_control_missing=3Dpresent
bash_cv_must_reinstall_sighandlers=3Dno
bash_cv_opendir_not_robust=3Dno
bash_cv_pgrp_pipe=3Dno
bash_cv_printf_a_format=3Dyes
bash_cv_sys_named_pipes=3Dpresent
bash_cv_sys_siglist=3Dyes
bash_cv_type_rlimit=3Drlim_t
bash_cv_ulimit_maxfds=3Dyes
bash_cv_under_sys_siglist=3Dyes
bash_cv_unusable_rtsigs=3Dno
cvs_cv_func_printf_ptr=3Dyes
db_cv_align_t=3D'unsigned long long'
db_cv_alignp_t=3D'unsigned long long'
db_cv_fcntl_f_setfd=3Dyes
db_cv_path_ar=3D/usr/bin/ar
db_cv_path_chmod=3D/bin/chmod
db_cv_path_cp=3D/bin/cp
db_cv_path_ln=3D/bin/ln
db_cv_path_mkdir=3D/bin/mkdir
db_cv_path_ranlib=3D/usr/bin/ranlib
db_cv_path_rm=3D/bin/rm
db_cv_path_sh=3D/bin/sh
db_cv_path_strip=3D/usr/bin/strip
db_cv_sprintf_count=3Dyes
fu_cv_sys_stat_statfs2_bsize=3Dyes
gl_cv_func_btowc_eof=3Dyes
gl_cv_func_fstatat_zero_flag=3Dyes
gl_cv_func_mbrtowc_incomplete_state=3Dyes
gl_cv_func_mbrtowc_nul_retval=3Dyes
gl_cv_func_mbrtowc_null_arg=3Dyes
gl_cv_func_mbrtowc_retval=3Dyes
gl_cv_func_mbrtowc_sanitycheck=3Dyes
gl_cv_func_wcrtomb_retval=3Dyes
gl_cv_func_wctob_works=3Dyes
glib_cv___va_copy=3Dyes
glib_cv_compliant_posix_memalign=3D1
glib_cv_has__inline=3Dyes
glib_cv_has__inline__=3Dyes
glib_cv_hasinline=3Dyes
glib_cv_have_qsort_r=3Dyes
glib_cv_long_long_format=3Dll
glib_cv_rtldglobal_broken=3Dyes
glib_cv_sane_realloc=3Dyes
glib_cv_sizeof_gmutex=3D40
glib_cv_sizeof_intmax_t=3D8
glib_cv_sizeof_ptrdiff_t=3D8
glib_cv_sizeof_size_t=3D8
glib_cv_sizeof_system_thread=3D8
glib_cv_stack_grows=3Dno
glib_cv_strlcpy=3Dno
glib_cv_sys_pthread_cond_timedwait_posix=3Dyes
glib_cv_sys_pthread_getspecific_posix=3Dyes
glib_cv_sys_pthread_mutex_trylock_posix=3Dyes
glib_cv_uscore=3Dno
glib_cv_va_copy=3Dyes
glib_cv_va_val_copy=3Dno
gt_cv_locale_fr=3Dfr_FR
lf_cv_sane_realloc=3Dyes
lftp_cv_va_val_copy=3Dno
libIDL_cv_long_long_format=3Dll
lt_cv_ar_at_file=3D@
lt_cv_archive_cmds_need_lc=3Dno
lt_cv_deplibs_check_method=3Dpass_all
lt_cv_file_magic_cmd=3D'$MAGIC_CMD'
lt_cv_file_magic_test_file=3D
lt_cv_ld_reload_flag=3D-r
lt_cv_nm_interface=3D'BSD nm'
lt_cv_objdir=3D.libs
lt_cv_path_LD=3D'ld '
lt_cv_path_LDCXX=3D'ld  -m elf_x86_64'
lt_cv_path_NM=3Dnm
lt_cv_path_mainfest_tool=3Dno
lt_cv_prog_compiler_c_o=3Dyes
lt_cv_prog_compiler_c_o_CXX=3Dyes
lt_cv_prog_compiler_pic=3D'-fPIC -DPIC'
lt_cv_prog_compiler_pic_CXX=3D'-fPIC -DPIC'
lt_cv_prog_compiler_pic_works=3Dyes
lt_cv_prog_compiler_pic_works_CXX=3Dyes
lt_cv_prog_compiler_rtti_exceptions=3Dno
lt_cv_prog_compiler_static_works=3Dyes
lt_cv_prog_compiler_static_works_CXX=3Dyes
lt_cv_prog_gnu_ld=3Dyes
lt_cv_prog_gnu_ldcxx=3Dyes
lt_cv_sharedlib_from_linklib_cmd=3D'printf %s\n'
lt_cv_shlibpath_overrides_runpath=3Dno
lt_cv_sys_global_symbol_pipe=3D'sed -n -e '\''s/^.*[	 ]\([ABCDGIRSTW][ABCDG=
IRSTW]*\)[	 ][	 ]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p'\'' | sed '\''/ __=
gnu_lto/d'\'''
lt_cv_sys_global_symbol_to_c_name_address=3D'sed -n -e '\''s/^: \(.*\) .*$/=
  {"\1", (void *) 0},/p'\'' -e '\''s/^[ABCDGIRSTW][ABCDGIRSTW]* .* \(.*\)$/=
  {"\1", (void *) \&\1},/p'\'''
lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'sed -n -e '\''s/^: =
\(.*\) .*$/  {"\1", (void *) 0},/p'\'' -e '\''s/^[ABCDGIRSTW][ABCDGIRSTW]* =
.* \(lib.*\)$/  {"\1", (void *) \&\1},/p'\'' -e '\''s/^[ABCDGIRSTW][ABCDGIR=
STW]* .* \(.*\)$/  {"lib\1", (void *) \&\1},/p'\'''
lt_cv_sys_global_symbol_to_cdecl=3D'sed -n -e '\''s/^T .* \(.*\)$/extern in=
t \1();/p'\'' -e '\''s/^[ABCDGIRSTW][ABCDGIRSTW]* .* \(.*\)$/extern char \1=
;/p'\'''
lt_cv_sys_global_symbol_to_import=3D
lt_cv_sys_max_cmd_len=3D1572864
lt_cv_to_host_file_cmd=3Dfunc_convert_file_noop
lt_cv_to_tool_file_cmd=3Dfunc_convert_file_noop
lt_cv_truncate_bin=3D'/usr/bin/dd bs=3D4096 count=3D1'
mr_cv_target_elf=3Dyes
nano_cv_func_regexec_segv_emptystr=3Dno
nfsd_cv_broken_setfsuid=3D0
nfsd_cv_bsd_signals=3Dyes
nfsd_cv_func_statfs=3Dstatfs2_bsize
samba_cv_HAVE_IFACE_AIX=3Dno
samba_cv_HAVE_IFACE_IFCONF=3Dyes
samba_cv_HAVE_IFACE_IFREQ=3Dyes
samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=3Dno
samba_cv_HAVE_VA_COPY=3Dyes
screen_cv_sys_bcopy_overlap=3Dno
screen_cv_sys_fifo_broken_impl=3Dyes
screen_cv_sys_fifo_usable=3Dyes
screen_cv_sys_memcpy_overlap=3Dno
screen_cv_sys_memmove_overlap=3Dno
screen_cv_sys_select_broken_retval=3Dno
screen_cv_sys_sockets_nofs=3Dno
screen_cv_sys_sockets_usable=3Dyes
screen_cv_sys_terminfo_used=3Dyes
shadow_cv_logdir=3D/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroot=
s/x86_64-linux/var/log
shadow_cv_maildir=3D/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroo=
ts/x86_64-linux/var/spool/mail
shadow_cv_mailfile=3DMailbox
shadow_cv_passwd_dir=3D/home/jack/Work/oe-core.git/test-build/tmp-glibc/sys=
roots/x86_64-linux/usr/bin
shadow_cv_utmpdir=3D/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroo=
ts/x86_64-linux/var/run
slrn_cv_va_val_copy=3Dno
sudo_cv_func_unsetenv_void=3Dno
svn_cv_atomic_builtins=3Dyes
tcl_cv_api_serial=3Dtermios
utils_cv_sys_open_max=3D1015
xorg_cv_malloc0_returns_null=3Dyes

## ----------------- ##
## Output variables. ##
## ----------------- ##

APACHE_INCLUDES=3D''
APACHE_LDFLAGS=3D''
APACHE_LIBEXECDIR=3D'no'
APXS=3D'no'
AR=3D'ar'
AWK=3D'gawk'
BDB_TEST_DEPS=3D''
BDB_TEST_PROGRAMS=3D''
BUILD_RULES=3D'fsmod-lib ramod-lib lib bin test sub-test  tools serf-lib'
CC=3D'gcc '
CFLAGS=3D'-isystem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/usr/include -O2 -pipe   -pthread'
CMAINTAINERFLAGS=3D''
CMODEFLAGS=3D'-std=3Dc90 '
CPP=3D'gcc  -E'
CPPFLAGS=3D'-isystem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroo=
ts/x86_64-linux/usr/include   -DLINUX -D_REENTRANT -D_GNU_SOURCE'
CTYPESGEN=3D''
CXX=3D'g++ '
CXXCPP=3D'g++  -E'
CXXFLAGS=3D'-isystem/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroo=
ts/x86_64-linux/usr/include -O2 -pipe'
CXXMAINTAINERFLAGS=3D''
CXXMODEFLAGS=3D'-std=3Dc++98 '
DEFS=3D''
DLLTOOL=3D'false'
DOXYGEN=3D'none'
DSYMUTIL=3D''
DUMPBIN=3D''
ECHO_C=3D''
ECHO_N=3D'-n'
ECHO_T=3D''
EGREP=3D'/usr/bin/grep -E'
EXEEXT=3D''
FGREP=3D'/usr/bin/grep -F'
FIX_JAVAHL_LIB=3D''
GETTEXT_CODESET=3D'#'
GREP=3D'/usr/bin/grep'
INCLUDE_OUTPUTS=3D''
INSTALL_APACHE_MODS=3D'false'
INSTALL_DATA=3D'${INSTALL} -m 644'
INSTALL_EXTRA_JAVAHL_LIB=3D''
INSTALL_PROGRAM=3D'${INSTALL}'
INSTALL_RULES=3D'install-fsmod-lib install-ramod-lib install-serf-lib insta=
ll-lib install-include install-static'
INSTALL_SCRIPT=3D'${INSTALL}'
INSTALL_STATIC_RULES=3D'install-bin install-docs install-serf-lib'
JAR=3D'none'
JAVA=3D''
JAVAC=3D'none'
JAVAC_FLAGS=3D''
JAVADOC=3D'none'
JAVAH=3D'none'
JAVAHL_COMPAT_TESTS_TARGET=3D''
JAVAHL_OBJDIR=3D''
JAVAHL_TESTS_TARGET=3D''
JAVA_CLASSPATH=3D''
JDK=3D''
JNI_INCLUDES=3D'none'
KDE4_CONFIG=3D''
LD=3D'ld  -m elf_x86_64'
LDFLAGS=3D'-L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_=
64-linux/usr/lib -L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroot=
s/x86_64-linux/lib -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-build/t=
mp-glibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/home/jack/Work/oe-c=
ore.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath,/home/jac=
k/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib -Wl,-=
rpath,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linu=
x/lib -Wl,-O1  -L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/=
x86_64-linux/usr/lib'
LIBOBJS=3D''
LIBS=3D''
LIBTOOL=3D'$(top_builddir)/x86_64-linux-libtool'
LIPO=3D''
LN_S=3D'ln -s'
LTLIBOBJS=3D''
LT_CFLAGS=3D''
LT_CXX_LIBADD=3D''
LT_LDFLAGS=3D''
LT_NO_UNDEFINED=3D''
LT_SYS_LIBRARY_PATH=3D''
MANIFEST_TOOL=3D':'
MKDIR=3D'/usr/bin/install -c -d'
MOD_ACTIVATION=3D''
MSGFMT=3D''
MSGFMTFLAGS=3D''
MSGMERGE=3D''
NM=3D'nm'
NMEDIT=3D''
NO_GETTEXT_CODESET=3D'#'
OBJDUMP=3D'objdump'
OBJEXT=3D'o'
OTOOL64=3D''
OTOOL=3D''
PACKAGE_BUGREPORT=3D'http://subversion.apache.org/'
PACKAGE_NAME=3D'subversion'
PACKAGE_STRING=3D'subversion 1.8.13'
PACKAGE_TARNAME=3D'subversion'
PACKAGE_URL=3D''
PACKAGE_VERSION=3D'1.8.13'
PATH_SEPARATOR=3D':'
PERL=3D'/usr/bin/perl'
PKG_CONFIG=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86=
_64-linux/usr/bin/pkg-config'
PYTHON=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-=
linux/usr/bin/python-native/python'
RANLIB=3D'ranlib'
RDOC=3D''
RUBY=3D'none'
RUBY_MAJOR=3D''
RUBY_MINOR=3D''
RUBY_TEENY=3D''
SED=3D'sed'
SHELL=3D'/bin/sh'
STRIP=3D'strip'
SVN_APRUTIL_CONFIG=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysr=
oots/x86_64-linux/usr/bin/apu-1-config'
SVN_APRUTIL_INCLUDES=3D' -I/home/jack/Work/oe-core.git/test-build/tmp-glibc=
/sysroots/x86_64-linux/usr/include -I/home/jack/Work/oe-core.git/test-build=
/tmp-glibc/sysroots/x86_64-linux/usr/include'
SVN_APRUTIL_LIBS=3D'-L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysr=
oots/x86_64-linux/usr/lib -laprutil-1'
SVN_APR_CONFIG=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/usr/bin/apr-1-config'
SVN_APR_INCLUDES=3D' -I/home/jack/Work/oe-core.git/test-build/tmp-glibc/sys=
roots/x86_64-linux/usr/include '
SVN_APR_LIBS=3D'-lapr-1'
SVN_APR_MEMCACHE_INCLUDES=3D''
SVN_APR_MEMCACHE_LIBS=3D''
SVN_APR_SHLIB_PATH_VAR=3D'LD_LIBRARY_PATH'
SVN_BINDIR=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86=
_64-linux/usr/bin'
SVN_CONFIG_SCRIPT_FILES=3D''
SVN_DB_INCLUDES=3D''
SVN_DB_LIBS=3D''
SVN_FS_LIB_DEPS=3D''
SVN_FS_LIB_INSTALL_DEPS=3D''
SVN_FS_LIB_LINK=3D''
SVN_GNOME_KEYRING_INCLUDES=3D''
SVN_GNOME_KEYRING_LIBS=3D''
SVN_HAVE_GPG_AGENT=3D''
SVN_KWALLET_INCLUDES=3D''
SVN_KWALLET_LIBS=3D''
SVN_LIBTOOL=3D'$(SHELL) $(abs_builddir)/x86_64-linux-libtool'
SVN_LT_SOVERSION=3D'-version-info 0'
SVN_MAGIC_INCLUDES=3D''
SVN_MAGIC_LIBS=3D'-lmagic'
SVN_RA_LIB_DEPS=3D''
SVN_RA_LIB_INSTALL_DEPS=3D''
SVN_RA_LIB_LINK=3D''
SVN_SASL_INCLUDES=3D''
SVN_SASL_LIBS=3D''
SVN_SERF_INCLUDES=3D'-I/home/jack/Work/oe-core.git/test-build/tmp-glibc/sys=
roots/x86_64-linux/usr/include/serf-1 -I/home/jack/Work/oe-core.git/test-bu=
ild/tmp-glibc/sysroots/x86_64-linux/usr/include'
SVN_SERF_LIBS=3D'-L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroot=
s/x86_64-linux/usr/lib -lserf-1'
SVN_SQLITE_INCLUDES=3D''
SVN_SQLITE_LIBS=3D'-lsqlite3'
SVN_XML_INCLUDES=3D''
SVN_XML_LIBS=3D'-lexpat'
SVN_ZLIB_INCLUDES=3D''
SVN_ZLIB_LIBS=3D'-lz'
SWIG=3D'none'
SWIG_CPPFLAGS=3D''
SWIG_LDFLAGS=3D'-L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/usr/lib -L/home/jack/Work/oe-core.git/test-build/tmp-glibc/sy=
sroots/x86_64-linux/lib -Wl,-rpath-link,/home/jack/Work/oe-core.git/test-bu=
ild/tmp-glibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/home/jack/Work=
/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath,/hom=
e/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-linux/usr/lib =
-Wl,-rpath,/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64=
-linux/lib -Wl,-O1'
SWIG_PL_INCLUDES=3D''
SWIG_PY_COMPILE=3D' -isystem/home/jack/Work/oe-core.git/test-build/tmp-glib=
c/sysroots/x86_64-linux/usr/include -O2 -pipe   -pthread'
SWIG_PY_INCLUDES=3D'$(SWIG_INCLUDES) '
SWIG_PY_LIBS=3D''
SWIG_PY_LINK=3D''
SWIG_RB_COMPILE=3D''
SWIG_RB_INCLUDES=3D''
SWIG_RB_LIBS=3D''
SWIG_RB_LINK=3D''
SWIG_RB_SITE_ARCH_DIR=3D''
SWIG_RB_SITE_LIB_DIR=3D''
SWIG_RB_TEST_VERBOSE=3D''
TRANG=3D'none'
TRANSFORM_LIBTOOL_SCRIPTS=3D''
XGETTEXT=3D''
abs_builddir=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/work/x86_6=
4-linux/subversion-native/1.8.13-r0/build'
abs_srcdir=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/work/x86_64-=
linux/subversion-native/1.8.13-r0/subversion-1.8.13'
ac_ct_AR=3D''
ac_ct_CC=3D''
ac_ct_CXX=3D''
ac_ct_DUMPBIN=3D''
bindir=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-=
linux/usr/bin'
build=3D'x86_64-pc-linux-gnu'
build_alias=3D'x86_64-linux'
build_cpu=3D'x86_64'
build_os=3D'linux-gnu'
build_vendor=3D'pc'
canonicalized_srcdir=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/wo=
rk/x86_64-linux/subversion-native/1.8.13-r0/subversion-1.8.13/'
datadir=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64=
-linux/usr/share'
datarootdir=3D'${prefix}/share'
docdir=3D'${datarootdir}/doc/${PACKAGE_TARNAME}'
dvidir=3D'${docdir}'
exec_prefix=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x8=
6_64-linux/usr'
host=3D'x86_64-pc-linux-gnu'
host_alias=3D'x86_64-linux'
host_cpu=3D'x86_64'
host_os=3D'linux-gnu'
host_vendor=3D'pc'
htmldir=3D'${docdir}'
includedir=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86=
_64-linux/usr/include'
infodir=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64=
-linux/usr/share/info'
libdir=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-=
linux/usr/lib'
libexecdir=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86=
_64-linux/usr/lib/subversion'
libsvn_auth_gnome_keyring_LDFLAGS=3D'-Wl,--no-undefined'
libsvn_auth_kwallet_LDFLAGS=3D'-Wl,--no-undefined'
libsvn_client_LDFLAGS=3D'-Wl,--no-undefined'
libsvn_delta_LDFLAGS=3D'-Wl,--no-undefined'
libsvn_diff_LDFLAGS=3D'-Wl,--no-undefined'
libsvn_fs_LDFLAGS=3D'-Wl,--no-undefined'
libsvn_fs_base_LDFLAGS=3D'-Wl,--no-undefined'
libsvn_fs_fs_LDFLAGS=3D'-Wl,--no-undefined'
libsvn_fs_util_LDFLAGS=3D'-Wl,--no-undefined'
libsvn_ra_LDFLAGS=3D'-Wl,--no-undefined'
libsvn_ra_local_LDFLAGS=3D'-Wl,--no-undefined'
libsvn_ra_serf_LDFLAGS=3D'-Wl,--no-undefined'
libsvn_ra_svn_LDFLAGS=3D'-Wl,--no-undefined'
libsvn_repos_LDFLAGS=3D'-Wl,--no-undefined'
libsvn_subr_LDFLAGS=3D'-Wl,--no-undefined'
libsvn_wc_LDFLAGS=3D'-Wl,--no-undefined'
localedir=3D'${datadir}/locale'
localstatedir=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/=
x86_64-linux/var'
mandir=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-=
linux/usr/share/man'
oldincludedir=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/=
x86_64-linux/usr/include'
pdfdir=3D'${docdir}'
prefix=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64-=
linux/usr'
program_transform_name=3D's,x,x,'
psdir=3D'${docdir}'
sbindir=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86_64=
-linux/usr/sbin'
sharedstatedir=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots=
/x86_64-linux/com'
sysconfdir=3D'/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroots/x86=
_64-linux/etc'
target=3D'x86_64-pc-linux-gnu'
target_alias=3D'x86_64-linux'
target_cpu=3D'x86_64'
target_os=3D'linux-gnu'
target_vendor=3D'pc'

## ----------- ##
## confdefs.h. ##
## ----------- ##

/* confdefs.h */
#define PACKAGE_NAME "subversion"
#define PACKAGE_TARNAME "subversion"
#define PACKAGE_VERSION "1.8.13"
#define PACKAGE_STRING "subversion 1.8.13"
#define PACKAGE_BUGREPORT "http://subversion.apache.org/"
#define PACKAGE_URL ""
#define SVN_SOVERSION 0
#define STDC_HEADERS 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_SYS_STAT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRING_H 1
#define HAVE_MEMORY_H 1
#define HAVE_STRINGS_H 1
#define HAVE_INTTYPES_H 1
#define HAVE_STDINT_H 1
#define HAVE_UNISTD_H 1
#define SVN_HAVE_SERF 1
#define SVN_HAVE_MEMCACHE 1
#define SVN_HAS_ATOMIC_BUILTINS 1
#define SVN_BINDIR "/home/jack/Work/oe-core.git/test-build/tmp-glibc/sysroo=
ts/x86_64-linux/usr/bin"
#define SVN_LOCALE_DIR "/home/jack/Work/oe-core.git/test-build/tmp-glibc/sy=
sroots/x86_64-linux/usr/share/locale"
#define HAVE_DLFCN_H 1
#define LT_OBJDIR ".libs/"
#define SVN_FS_WANT_DB_MAJOR 4
#define SVN_FS_WANT_DB_MINOR 0
#define SVN_FS_WANT_DB_PATCH 14
#define SVN_HAVE_GPG_AGENT 1
#define SVN_HAVE_LIBMAGIC 1
#define STDC_HEADERS 1
#define HAVE_VPRINTF 1
#define HAVE_SYMLINK 1
#define HAVE_READLINK 1
#define HAVE_SYS_UTSNAME_H 1
#define HAVE_UNAME 1
#define HAVE_TCGETATTR 1
#define HAVE_TERMIOS_H 1
#define HAVE_TCSETATTR 1
#define HAVE_TERMIOS_H 1

configure: exit 1

--------------030802070706020000070608--
