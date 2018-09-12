Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id B448F795D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 02:15:44 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 2C909220054
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 14:15:44 +1200 (NZST)
To: openembedded-core@lists.openembedded.org
References: <20180912012707.30046-1-douglas.royds@taitradio.com>
	<20180912020259.13844.22579@do.openembedded.org>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <6bf60656-78b8-7c83-4755-d0d6db9cb6b6@taitradio.com>
Date: Wed, 12 Sep 2018 14:15:44 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180912020259.13844.22579@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFJlcHJvZHVjaWJsZTogRmluZCB0aGUgZ2l0IHJlcG8gaW4gV09SS0RJUi9naXQgb3IgUyBmaXJzdA==?=
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
X-List-Received-Date: Wed, 12 Sep 2018 02:15:45 -0000
Content-Type: multipart/alternative;
	boundary="------------3EFC47972233E88BA2E50596"
Content-Language: en-GB

--------------3EFC47972233E88BA2E50596
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The patch series already was applied on top of b7f3f7ecfd.

I observe at 
http://lists.openembedded.org/pipermail/openembedded-core/2018-September/thread.html 
that the patch set didn't hit the list threaded. Might this have been 
the reason for the Patchwork rejection?

git send-email appears (at my end) to have correctly set the headers, 
eg. from path 6/6:

    From: Douglas Royds <douglas.royds@taitradio.com>
    To: openembedded-core@lists.openembedded.org
    Cc: Douglas Royds <douglas.royds@taitradio.com>
    Subject: [PATCH 6/6] Reproducible: Consistent debug logging
    Date: Wed, 12 Sep 2018 13:27:07 +1200
    Message-Id: <20180912012707.30046-7-douglas.royds@taitradio.com>
    X-Mailer: git-send-email 2.17.1
    In-Reply-To: <20180912012707.30046-1-douglas.royds@taitradio.com>
    References: <20180912012707.30046-1-douglas.royds@taitradio.com>

Suggestions?


On 12/09/18 14:02, Patchwork wrote:

> == Series Details ==
>
> Series: Reproducible: Find the git repo in WORKDIR/git or S first
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/14024/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>    Suggested fix    Rebase your series on top of targeted branch
>    Targeted branch  master (currently at b7f3f7ecfd)
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>


--------------3EFC47972233E88BA2E50596
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>The patch series already was applied on top of b7f3f7ecfd.</p>
    <p>I observe at
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/pipermail/openembedded-core/2018-September/thread.html">http://lists.openembedded.org/pipermail/openembedded-core/2018-September/thread.html</a>
      that the patch set didn't hit the list threaded. Might this have
      been the reason for the Patchwork rejection?<br>
    </p>
    <p>git send-email appears (at my end) to have correctly set the
      headers, eg. from path 6/6:</p>
    <blockquote>
      <pre>From: Douglas Royds <a class="moz-txt-link-rfc2396E" href="mailto:douglas.royds@taitradio.com">&lt;douglas.royds@taitradio.com&gt;</a>
To: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
Cc: Douglas Royds <a class="moz-txt-link-rfc2396E" href="mailto:douglas.royds@taitradio.com">&lt;douglas.royds@taitradio.com&gt;</a>
Subject: [PATCH 6/6] Reproducible: Consistent debug logging
Date: Wed, 12 Sep 2018 13:27:07 +1200
Message-Id: <a class="moz-txt-link-rfc2396E" href="mailto:20180912012707.30046-7-douglas.royds@taitradio.com">&lt;20180912012707.30046-7-douglas.royds@taitradio.com&gt;</a>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <a class="moz-txt-link-rfc2396E" href="mailto:20180912012707.30046-1-douglas.royds@taitradio.com">&lt;20180912012707.30046-1-douglas.royds@taitradio.com&gt;</a>
References: <a class="moz-txt-link-rfc2396E" href="mailto:20180912012707.30046-1-douglas.royds@taitradio.com">&lt;20180912012707.30046-1-douglas.royds@taitradio.com&gt;</a></pre>
    </blockquote>
    <p>Suggestions?<br>
    </p>
    <p><br>
    </p>
    <p>On 12/09/18 14:02, Patchwork wrote:
      <blockquote type="cite">
        <pre wrap="">== Series Details ==

Series: Reproducible: Find the git repo in WORKDIR/git or S first
Revision: 1
URL   : <a class="moz-txt-link-freetext" href="https://patchwork.openembedded.org/series/14024/">https://patchwork.openembedded.org/series/14024/</a>
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at b7f3f7ecfd)



If you believe any of these test results are incorrect, please reply to the
mailing list (<a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -&gt; [PATCH v2] -&gt;
[PATCH v3] -&gt; ...).

---
Guidelines:     <a class="moz-txt-link-freetext" href="https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines">https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines</a>
Test framework: <a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/patchtest">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest</a>
Test suite:     <a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe</a>

</pre>
      </blockquote>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------3EFC47972233E88BA2E50596--
