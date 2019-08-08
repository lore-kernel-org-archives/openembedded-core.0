Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 330C77F338
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 13:07:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x78D7TPL020705
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Aug 2019 06:07:50 -0700
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 8 Aug 2019 06:07:22 -0700
To: <openembedded-core@lists.openembedded.org>, Trevor Gamblin
	<trevor.gamblin@windriver.com>
References: <1565269148-14827-1-git-send-email-Trevor.Gamblin@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <ec3623b8-8c3c-08c0-90b7-2c9e7f5bb543@windriver.com>
Date: Thu, 8 Aug 2019 09:07:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565269148-14827-1-git-send-email-Trevor.Gamblin@windriver.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [warrior][PATCH] patch: fix CVE-2019-13638
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
X-List-Received-Date: Thu, 08 Aug 2019 13:08:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 8/8/19 8:59 AM, Trevor Gamblin wrote:
>               file://0001-Fix-swapping-fake-lines-in-pch_swap.patch  \
> +<<<<<<< HEAD
> +=======
> +file://CVE-2019-13636.patch  \
> +file://0001-Invoke-ed-directly-instead-of-using-the-shell.patch  \
> +>>>>>>> 982b946... patch: fix CVE-2019-13638
>   "
>   

Oops. The cherry-pick from master didn't go well.
Please fix and send a v2.

-- 
# Randy MacLeod
# Wind River Linux

