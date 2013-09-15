Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 99EBB61011
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2013 20:27:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8FKRi9Q020756
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Sep 2013 13:27:44 -0700 (PDT)
Received: from [128.224.22.91] (128.224.22.91) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 15 Sep 2013 13:27:42 -0700
Message-ID: <5236183B.9000301@windriver.com>
Date: Sun, 15 Sep 2013 16:27:39 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Yevhen Kyriukha <kirgene@gmail.com>
References: <CADV-EXFKZrRS5K-_dsxVe570Q3ESi6Oqg3muNXgfmgu6RttrPQ@mail.gmail.com>
In-Reply-To: <CADV-EXFKZrRS5K-_dsxVe570Q3ESi6Oqg3muNXgfmgu6RttrPQ@mail.gmail.com>
X-Originating-IP: [128.224.22.91]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patch for psplash
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
X-List-Received-Date: Sun, 15 Sep 2013 20:27:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-09-15 11:03 AM, Yevhen Kyriukha wrote:
> Hi!
>
> I made a patch for psplash to work without mmap support.
> How can I submit this patch to psplash repository?

If you mean that you want to patch the oe-core version of
psplash, then see:
    http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded


If you want the upstream then look at:
    http://git.yoctoproject.org/cgit/cgit.cgi/psplash/tree/
and see who has made the most commits and send them an email.
That seems to be Richard Purdie based on the ChangeLog.

// Randy

>
> Best regards,
> Yevhen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

