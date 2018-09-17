Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 70AD3607A4;
	Mon, 17 Sep 2018 14:29:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8HETbaO024655
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 07:29:37 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 17 Sep 2018 07:29:37 -0700
To: Mohamed Dawod <mhm.dawod@gmail.com>,
	<openembedded-core@lists.openembedded.org>,
	<openembedded-devel@lists.openembedded.org>
References: <CAGCTLNQh9pWNTZJW=OxYBKMJSBiHqYHx3DT0ed5syTf11n1_2Q@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <70000375-8881-3fb4-c311-a5333beaa429@windriver.com>
Date: Mon, 17 Sep 2018 10:29:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAGCTLNQh9pWNTZJW=OxYBKMJSBiHqYHx3DT0ed5syTf11n1_2Q@mail.gmail.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [oe] [openembedded][patchwork]: new patch
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
X-List-Received-Date: Mon, 17 Sep 2018 14:29:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 09/17/2018 10:07 AM, Mohamed Dawod wrote:
> Hello everyone,
> 
> Last week, I asked about how to hide the Mouse cursor in "wayland" because
> I need it to be like a mobile interface.
> 
> No one answered me and later I found that it is not possible or there is no
> thing ready made to do that.
> so, I spent three days reading "wayland" and "weston" source code trying to
> solve this problem and finally I succeeded in hiding the mouse cursor .
> I wrote patch file for "bitbake" to use it.

Excellent, thanks for doing that.

> 
> Now, I want to sumit this patch file to patchwork
> <https://patchwork.openembedded.org/> as my first open source contribution.
> How to do this basically ?

The patch submission guidelines are documented here:
    http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded


Good luck,
../Randy
> 
> Thank you,
> Regards,
> 


-- 
# Randy MacLeod
# Wind River Linux

