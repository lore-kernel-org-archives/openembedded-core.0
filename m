Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4B400606CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 14:30:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0JEUG1a008986
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 19 Jan 2017 06:30:16 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 19 Jan 2017 06:30:16 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1484747560.git.bruce.ashfield@windriver.com>
	<7fdbf6137f68f008170006c2ba7bb99d4e1e8504.1484747560.git.bruce.ashfield@windriver.com>
	<CAJTo0La77QUiZm1yqvVfL4Mj44rXf6sVOBXThp_z4EDYdsB0qw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <43202524-9f59-5b81-13b3-5824c9716d04@windriver.com>
Date: Thu, 19 Jan 2017 09:30:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0La77QUiZm1yqvVfL4Mj44rXf6sVOBXThp_z4EDYdsB0qw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/14] kern-tools: kconf_check: flag CONFIG options with invalid spaces
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
X-List-Received-Date: Thu, 19 Jan 2017 14:30:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-01-19 09:06 AM, Burton, Ross wrote:
>
> On 18 January 2017 at 13:54, Bruce Ashfield
> <bruce.ashfield@windriver.com <mailto:bruce.ashfield@windriver.com>> wrote:
>
>     -SRCREV = "be79004cb2535e79271822b3d74eda5ba12233d2"
>     +SRCREV = "bf2942f7559d114e96f7c7f1287bf7e5120632a"
>
>
> Somehow you managed to drop a digit from the SHA, I've a fix locally.

hah. I would have just nak'd it.

That is odd ... must have been during my rebase and edit I did just
before sending.

Thanks though!

Bruce



>
> Ross


