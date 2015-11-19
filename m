Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id ED5246010D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:24:27 +0000 (UTC)
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
	mgwym02.jp.fujitsu.com with smtp
	id 7051_639b_38ba0433_4f7b_4bd1_ab88_877287878a3c;
	Thu, 19 Nov 2015 18:24:21 +0900
Received: from m3050.s.css.fujitsu.com (msm.b.css.fujitsu.com [10.134.21.208])
	by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C72FAC02F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 18:24:21 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3050.s.css.fujitsu.com (Postfix) with ESMTP id F2A4A1DA;
	Thu, 19 Nov 2015 18:24:20 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id CC7DE1E0089;
	Thu, 19 Nov 2015 18:24:20 +0900 (JST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <563C5648.5050009@jp.fujitsu.com>
	<CAJTo0LZsG+_bo5=+bYrfP3theSrW-aw2TR4Y-Ax_JVY3YnEKDg@mail.gmail.com>
	<5649B202.1060301@jp.fujitsu.com>
	<CAJTo0Laiibw3uxt1OHQK0MfTGcWrJsQYduPunx8sYJc0iq3+Gw@mail.gmail.com>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <564D9579.60602@jp.fujitsu.com>
Date: Thu, 19 Nov 2015 18:25:13 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Laiibw3uxt1OHQK0MfTGcWrJsQYduPunx8sYJc0iq3+Gw@mail.gmail.com>
X-TM-AS-MML: disable
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] wpa-supplicant: upgrade to 2.5
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
X-List-Received-Date: Thu, 19 Nov 2015 09:24:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

 > It looks like you generated a patch and then pasted it into the
 > Thunderbird composer, which means long lines wrap and the patch
 > corrupts.  Can you either send the patch without line wrapping or
 > ideally using git-send-email directly?
Sorry for the wrong way to send patch.
I will re-send the patch using git-send-email.

Best Regards,
Fan

On 2015年11月17日 00:03, Burton, Ross wrote:
>
> On 16 November 2015 at 10:37, Fan Xin <fan.xin@jp.fujitsu.com
> <mailto:fan.xin@jp.fujitsu.com>> wrote:
>
>     wpa-supplicant: upgrade to 2.5
>
>     1. upgrade to 2.5
>     2. remove eight patches since they have been applied in 2.5
>     3. update SRC_URI, HOMEPAGE and BUGTRACKER to use w1.fi
>     <http://w1.fi> instead
>
>     Signed-off-by: Fan Xin <fan.xin at jp.fujitsu.com
>     <http://jp.fujitsu.com>>
>
>
> It looks like you generated a patch and then pasted it into the
> Thunderbird composer, which means long lines wrap and the patch
> corrupts.  Can you either send the patch without line wrapping or
> ideally using git-send-email directly?
>
> Thanks,
> Ross


