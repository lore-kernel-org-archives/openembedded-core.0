Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F7AA773BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 05:57:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAG5vtRU006514
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Nov 2015 21:57:55 -0800
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 15 Nov 2015 21:57:54 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1447638105.git.kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <56497065.2080108@windriver.com>
Date: Mon, 16 Nov 2015 13:57:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1447638105.git.kai.kang@windriver.com>
Subject: Re: [PATCH 0/1] Add do_configure as dependency only when it exists
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
X-List-Received-Date: Mon, 16 Nov 2015 05:57:59 -0000
Content-Type: multipart/alternative;
	boundary="------------080607060804030903050409"

--------------080607060804030903050409
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年11月16日 09:44, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:
>
>    build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib kangkai/archiver
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/archiver
>
> Kai Kang (1):
>    archiver.bbclass: fix an exception of the mode configured
>
>   meta/classes/archiver.bbclass | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>


This patch is originally from Jian. I saw he sent the patch just now, so 
please ignore this one.

-- 
Regards,
Neil | Kai Kang


--------------080607060804030903050409
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2015年11月16日 09:44,
      <a class="moz-txt-link-abbreviated" href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a> wrote:<br>
    </div>
    <blockquote cite="mid:cover.1447638105.git.kai.kang@windriver.com"
      type="cite">
      <pre wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/archiver
  <a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/archiver">http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/archiver</a>

Kai Kang (1):
  archiver.bbclass: fix an exception of the mode configured

 meta/classes/archiver.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

</pre>
    </blockquote>
    <br>
    <br>
    <font size="+1">This patch is originally from Jian. I saw he sent
      the patch just now, so please ignore this one.</font><br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------080607060804030903050409--
