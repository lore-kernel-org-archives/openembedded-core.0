Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm02.jp.fujitsu.com (mgwkm02.jp.fujitsu.com [202.219.69.169])
	by mail.openembedded.org (Postfix) with ESMTP id CF86165CBB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 00:59:10 +0000 (UTC)
Received: from kw-mxauth.gw.nic.fujitsu.com (unknown [192.168.231.132]) by
	mgwkm02.jp.fujitsu.com with smtp
	id 58f2_e7d0_7fa1473d_d3e9_40db_b362_f61c7a340180;
	Wed, 03 Aug 2016 09:59:06 +0900
Received: from m3050.s.css.fujitsu.com (msm.b.css.fujitsu.com [10.134.21.208])
	by kw-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 08E4BAC011C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 09:59:06 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3050.s.css.fujitsu.com (Postfix) with ESMTP id EA99727F;
	Wed,  3 Aug 2016 09:59:05 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id CC5CB1E0088;
	Wed,  3 Aug 2016 09:59:05 +0900 (JST)
To: Stephen Arnold <stephen.arnold42@gmail.com>
References: <1470049297-6520-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAOLEWZVAjfydiq7GwgDKWydZyL_CXDL7+dgn5gsjt+QMhBQzgA@mail.gmail.com>
	<CAJTo0La6G0jmhMVKu1rGjjWrDkACFWNX70hrgY9rnyk2ifXKFg@mail.gmail.com>
	<CAOLEWZWbyZXc53TgQijWtxRbTQ9bEnTULpM9uUa4Hp5Px4AYKw@mail.gmail.com>
	<CAJTo0LbwrLtSG+wv=_379TeQOAAqBHVUet=bD0kfdUUg6_c-yw@mail.gmail.com>
	<8ff3e451-c185-6b95-03e0-9669b838b0dc@jp.fujitsu.com>
	<CAOLEWZX0tzxjWu=xq9+_R87uFWfH9DOMminYBMEu2M-7igcxyg@mail.gmail.com>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <3cdfa22c-ed0b-1e92-7d82-bc81c2e5ee3d@jp.fujitsu.com>
Date: Wed, 3 Aug 2016 09:59:45 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAOLEWZX0tzxjWu=xq9+_R87uFWfH9DOMminYBMEu2M-7igcxyg@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Aug 2016 00:59:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2016年08月03日 02:33, Stephen Arnold wrote:
> Hey, don't keep all the fun to yourself  :P
>
> Let's take a look at the recipes and marge the best bits together; I
> think I have an update on my end after getting some feedback with a
> zebra label printer.
>
> Fan, can you push/post your recipes somewhere today?  Feel free to
> fork meta-small-arm-extra and we can take a look at merging.
>
> Steve
>

I have pushed my recipes at here:

https://github.com/fan-xin/meta-printing

I checked meta-small-arm-extra but did not find what could be merged 
from my recipe.

I wonder where the cups-filters and qpdf recipe files should be put. In 
cups folder or separate folder ?

Fan




