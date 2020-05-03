Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web12.32526.1588543622544736665
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 15:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: codethink.co.uk, ip: 176.9.8.87, mailfrom: frazer.clews@codethink.co.uk)
Received: from host86-177-45-246.range86-177.btcentralplus.com ([86.177.45.246] helo=localhost.localdomain)
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1jVMlH-0000wf-9G
	for <openembedded-core@lists.openembedded.org> ; Sun, 03 May 2020 23:06:59 +0100
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgbGliL3RvYXN0ZXI6IGZpeHVwIGNvZGViYXNlIHNvIHB5ZG9jc3R5bGUgY2FuIHBhcnNl?=
References: <20200503170254.2273.86649@do>
To: openembedded-core@lists.openembedded.org
From: "Frazer Clews" <frazer.clews@codethink.co.uk>
X-Forwarded-Message-Id: <20200503170254.2273.86649@do>
Message-ID: <d1806962-afa3-0703-d71a-0fa4e744cde1@codethink.co.uk>
Date: Sun, 3 May 2020 23:06:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200503170254.2273.86649@do>
X-Groupsio-MsgNum: 137807
Content-Type: multipart/mixed;
 boundary="------------FA6A4403910B2ACD28C7B5BE"
Content-Language: en-US

--------------FA6A4403910B2ACD28C7B5BE
Content-Type: multipart/alternative;
 boundary="------------DCC2986C80A38926BB7E1FDB"

--------------DCC2986C80A38926BB7E1FDB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Not sure why this error is coming up, it seems to be rebased with the 
latest master branch

Thanks

Frazer



-------- Forwarded Message --------
Subject: 	✗ patchtest: failure for lib/toaster: fixup codebase so 
pydocstyle can parse
Date: 	Sun, 03 May 2020 17:02:54 -0000
From: 	Patchwork <patchwork@patchwork.openembedded.org>
Reply-To: 	openembedded-core@lists.openembedded.org
To: 	Frazer Clews <frazer.clews@codethink.co.uk>
CC: 	openembedded-core@lists.openembedded.org



== Series Details ==

Series: lib/toaster: fixup codebase so pydocstyle can parse
Revision: 1
URL : https://patchwork.openembedded.org/series/23925/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue Series does not apply on top of target branch 
[test_series_merge_on_head] Suggested fix Rebase your series on top of 
targeted branch
Targeted branch master (currently at 26eb22191f)



If you believe any of these test results are incorrect, please reply to the
mailing list (openembedded-core@lists.openembedded.org) raising your 
concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
[PATCH v3] -> ...).

---
Guidelines: 
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
Test suite: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe



--------------DCC2986C80A38926BB7E1FDB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Not sure why this error is coming up, it seems to be rebased with
      the latest master branch<br>
    </p>
    <p>Thanks</p>
    <p>Frazer<br>
    </p>
    <div class="moz-forward-container"><br>
      <br>
      -------- Forwarded Message --------
      <table class="moz-email-headers-table" cellspacing="0"
        cellpadding="0" border="0">
        <tbody>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">Subject:
            </th>
            <td>✗ patchtest: failure for lib/toaster: fixup codebase so
              pydocstyle can parse</td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">Date: </th>
            <td>Sun, 03 May 2020 17:02:54 -0000</td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">From: </th>
            <td>Patchwork <a class="moz-txt-link-rfc2396E" href="mailto:patchwork@patchwork.openembedded.org">&lt;patchwork@patchwork.openembedded.org&gt;</a></td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">Reply-To:
            </th>
            <td><a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a></td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">To: </th>
            <td>Frazer Clews <a class="moz-txt-link-rfc2396E" href="mailto:frazer.clews@codethink.co.uk">&lt;frazer.clews@codethink.co.uk&gt;</a></td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">CC: </th>
            <td><a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a></td>
          </tr>
        </tbody>
      </table>
      <br>
      <br>
      == Series Details ==<br>
      <br>
      Series: lib/toaster: fixup codebase so pydocstyle can parse<br>
      Revision: 1<br>
      URL : <a class="moz-txt-link-freetext" href="https://patchwork.openembedded.org/series/23925/">https://patchwork.openembedded.org/series/23925/</a><br>
      State : failure<br>
      <br>
      == Summary ==<br>
      <br>
      <br>
      Thank you for submitting this patch series to OpenEmbedded Core.
      This is<br>
      an automated response. Several tests have been executed on the
      proposed<br>
      series by patchtest resulting in the following failures:<br>
      <br>
      <br>
      <br>
      * Issue Series does not apply on top of target branch
      [test_series_merge_on_head] Suggested fix Rebase your series on
      top of targeted branch<br>
      Targeted branch master (currently at 26eb22191f)<br>
      <br>
      <br>
      <br>
      If you believe any of these test results are incorrect, please
      reply to the<br>
      mailing list (<a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>) raising
      your concerns.<br>
      Otherwise we would appreciate you correcting the issues and
      submitting a new<br>
      version of the patchset if applicable. Please ensure you
      add/increment the<br>
      version number when sending the new version (i.e. [PATCH] -&gt;
      [PATCH v2] -&gt;<br>
      [PATCH v3] -&gt; ...).<br>
      <br>
      ---<br>
      Guidelines:
      <a class="moz-txt-link-freetext" href="https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines">https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines</a><br>
      Test framework:
      <a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/patchtest">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest</a><br>
      Test suite: <a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe</a><br>
      <br>
      <br>
    </div>
  </body>
</html>

--------------DCC2986C80A38926BB7E1FDB--

--------------FA6A4403910B2ACD28C7B5BE
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-lib-toaster-fixup-codebase-so-pydocstyle-can-parse.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-lib-toaster-fixup-codebase-so-pydocstyle-can-parse.patc";
 filename*1="h"

From 6f6086e0a885b6fa09b3f7e78a410a2321705f58 Mon Sep 17 00:00:00 2001
From: Frazer Clews <frazer.clews@codethink.co.uk>
Date: Fri, 1 May 2020 17:17:48 +0100
Subject: [PATCH] lib/toaster: fixup codebase so pydocstyle can parse

fixed literal comparison in lsupdates so the
integer isn't treated as a singleton, also fix
indentation in perf

Signed-off-by: Frazer Clews <frazer.clews@codethink.co.uk>
---
 .../orm/management/commands/lsupdates.py      |  2 +-
 .../toastermain/management/commands/perf.py   | 68 +++++++++----------
 2 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/lib/toaster/orm/management/commands/lsupdates.py b/lib/toaster/orm/management/commands/lsupdates.py
index a4dbcaa7..2fbd7be3 100644
--- a/lib/toaster/orm/management/commands/lsupdates.py
+++ b/lib/toaster/orm/management/commands/lsupdates.py
@@ -68,7 +68,7 @@ class Command(BaseCommand):
                          (what,
                           pec))
         sys.stdout.flush()
-        if int(pec) is 100:
+        if int(pec) == 100:
             sys.stdout.write("\n")
             sys.stdout.flush()
 
diff --git a/lib/toaster/toastermain/management/commands/perf.py b/lib/toaster/toastermain/management/commands/perf.py
index 7d629fb3..5c41c5b2 100644
--- a/lib/toaster/toastermain/management/commands/perf.py
+++ b/lib/toaster/toastermain/management/commands/perf.py
@@ -17,46 +17,46 @@ class Command(BaseCommand):
     help    = "Test the response time for all toaster urls"
 
     def handle(self, *args, **options):
-	root_urlconf = __import__(settings.ROOT_URLCONF)
-	patterns = root_urlconf.urls.urlpatterns
-	global full_url
-	for pat in patterns:
-	    if pat.__class__.__name__ == 'RegexURLResolver':
-		url_root_res = str(pat).split('^')[1].replace('>', '')
-		if 'gui' in url_root_res:
-		    for url_patt in pat.url_patterns:
-			full_url = self.get_full_url(url_patt, url_root_res)
-			info = self.url_info(full_url)
-			status_code = info[0]
-			load_time = info[1]
-			print('Trying \'' + full_url + '\', ' + str(status_code) + ', ' + str(load_time))
+        root_urlconf = __import__(settings.ROOT_URLCONF)
+        patterns = root_urlconf.urls.urlpatterns
+        global full_url
+        for pat in patterns:
+            if pat.__class__.__name__ == 'RegexURLResolver':
+                url_root_res = str(pat).split('^')[1].replace('>', '')
+            if 'gui' in url_root_res:
+                for url_patt in pat.url_patterns:
+                    full_url = self.get_full_url(url_patt, url_root_res)
+                    info = self.url_info(full_url)
+                    status_code = info[0]
+                    load_time = info[1]
+                    print('Trying \'' + full_url + '\', ' + str(status_code) + ', ' + str(load_time))
 
     def get_full_url(self, url_patt, url_root_res):
-	full_url = str(url_patt).split('^')[1].replace('$>', '').replace('(?P<file_path>(?:/[', '/bin/busybox').replace('.*', '')
-	full_url = str(url_root_res + full_url)
-	full_url = re.sub('\(\?P<.*?>\\\d\+\)', '1', full_url)
-	full_url = 'http://localhost:8000/' + full_url
-	return full_url
+        full_url = str(url_patt).split('^')[1].replace('$>', '').replace('(?P<file_path>(?:/[', '/bin/busybox').replace('.*', '')
+        full_url = str(url_root_res + full_url)
+        full_url = re.sub('\(\?P<.*?>\\\d\+\)', '1', full_url)
+        full_url = 'http://localhost:8000/' + full_url
+        return full_url
 
     def url_info(self, full_url):
-	client = Client()
-	info = []
-	try:
-	    resp = client.get(full_url, follow = True)
-	except Exception as e_status_code:
+        client = Client()
+        info = []
+        try:
+            resp = client.get(full_url, follow = True)
+        except Exception as e_status_code:
             self.error('Url: %s, error: %s' % (full_url, e_status_code))
             resp = type('object', (), {'status_code':0, 'content': str(e_status_code)})
-	status_code = resp.status_code
-	info.append(status_code)
-	try:
-	    req = requests.get(full_url)
-	except Exception as e_load_time:
+        status_code = resp.status_code
+        info.append(status_code)
+        try:
+            req = requests.get(full_url)
+        except Exception as e_load_time:
             self.error('Url: %s, error: %s' % (full_url, e_load_time))
-	load_time = req.elapsed
-	info.append(load_time)
-	return info
+        load_time = req.elapsed
+        info.append(load_time)
+        return info
 
     def error(self, *args):
-	for arg in args:
-	    print(arg, end=' ', file=sys.stderr)
-	print(file=sys.stderr)
+        for arg in args:
+            print(arg, end=' ', file=sys.stderr)
+        print(file=sys.stderr)
-- 
2.26.2


--------------FA6A4403910B2ACD28C7B5BE--
