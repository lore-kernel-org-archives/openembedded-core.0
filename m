Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1EDF97002B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 05:32:23 +0000 (UTC)
Received: from yt-mxoi1.gw.nic.fujitsu.com (unknown [192.168.229.67]) by
	mgwym02.jp.fujitsu.com with smtp
	id 2e85_6735_73e053c2_30bc_406e_807b_2fd83c7e9fa8;
	Mon, 08 Aug 2016 14:32:16 +0900
Received: from m3050.s.css.fujitsu.com (msm.b.css.fujitsu.com [10.134.21.208])
	by yt-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id E65DEAC017A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 14:32:16 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3050.s.css.fujitsu.com (Postfix) with ESMTP id E093A28F;
	Mon,  8 Aug 2016 14:32:16 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id C6FC31E0088;
	Mon,  8 Aug 2016 14:32:16 +0900 (JST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1470204251-6173-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAJTo0LZUT+9Wgf+kvtUJwJj7_W2afRciuW5PA2OfRrXYBRO-qw@mail.gmail.com>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <7c20824b-3ac8-ff2c-208f-78ee85a5f528@jp.fujitsu.com>
Date: Mon, 8 Aug 2016 14:32:58 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZUT+9Wgf+kvtUJwJj7_W2afRciuW5PA2OfRrXYBRO-qw@mail.gmail.com>
X-TM-AS-MML: disable
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: upgrade to 20160510
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
X-List-Received-Date: Mon, 08 Aug 2016 05:32:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


> As this recipe fetches from git if you don't change SRCREV then it's not
> an upgrade.

Yes, you are right. I will modify the SRCREV and resend the patch.
Thanks for your comment.

Best Regards,
Fan


