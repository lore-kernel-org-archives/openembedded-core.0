Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id 48001731E5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 06:47:45 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym02.jp.fujitsu.com with smtp
	id 35c1_0eae_03f4ba19_0a78_4ba3_9da0_70dd7e92ca0a;
	Tue, 02 Aug 2016 15:47:42 +0900
Received: from m3051.s.css.fujitsu.com (m3051.s.css.fujitsu.com
	[10.134.21.209])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F958AC00E2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 15:47:41 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3051.s.css.fujitsu.com (Postfix) with ESMTP id 59729209;
	Tue,  2 Aug 2016 15:47:41 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id 3E31C1E0088;
	Tue,  2 Aug 2016 15:47:41 +0900 (JST)
To: "Burton, Ross" <ross.burton@intel.com>,
	Stephen Arnold <stephen.arnold42@gmail.com>
References: <1470049297-6520-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAOLEWZVAjfydiq7GwgDKWydZyL_CXDL7+dgn5gsjt+QMhBQzgA@mail.gmail.com>
	<CAJTo0La6G0jmhMVKu1rGjjWrDkACFWNX70hrgY9rnyk2ifXKFg@mail.gmail.com>
	<CAOLEWZWbyZXc53TgQijWtxRbTQ9bEnTULpM9uUa4Hp5Px4AYKw@mail.gmail.com>
	<CAJTo0LbwrLtSG+wv=_379TeQOAAqBHVUet=bD0kfdUUg6_c-yw@mail.gmail.com>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <8ff3e451-c185-6b95-03e0-9669b838b0dc@jp.fujitsu.com>
Date: Tue, 2 Aug 2016 15:48:19 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbwrLtSG+wv=_379TeQOAAqBHVUet=bD0kfdUUg6_c-yw@mail.gmail.com>
X-TM-AS-MML: disable
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Tue, 02 Aug 2016 06:47:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年08月02日 02:24, Burton, Ross wrote:
>
> On 1 August 2016 at 18:22, Stephen Arnold <stephen.arnold42@gmail.com
> <mailto:stephen.arnold42@gmail.com>> wrote:
>
>     That's actually not a bad idea, but I need to crank out another
>     abstract today (the deadline for special session snuck up on me).  We
>     kinda needed this for a project, but I think a tiny print server is
>     always useful.  What's your plan?
>
>
> Well my plan was:
>
> 1) say that someone should create meta-printing
> 2) watch someone create meta-printing
> 3) delete everything printing related in oe-core
>
> I can help a bit on (2) I guess...  Fan Xin, would you or anyone else at
> Fujitsu (as you clearly have interest here) be able to help?

Yes, Of course. Actually I am very pleased to do this.
I am afraid I can not do it very well, but I will try my best.

Fan

-- 


