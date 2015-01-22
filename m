Return-Path: <rapphil@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id AE1ED71637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 15:12:42 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id c9so1641359qcz.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 07:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ihc8Bhpe9l+BOb/fILDcHxAydQQVokHfeb0KYqM5J8g=;
	b=laBSeUz16ZuUR0qDo/zTHF9i8FCRvmUvrnFbl6zZqyDTsGSsufrPbqZR80dsqKGBTo
	TLvFwXHsAyGVpGcGw95KV6t20UsyGa34UwllEU4b2wK1dyy+CTV+Oq4YUObYLwmx9ECZ
	Uf8nJEl9hfdcnQzQoz1+0myaXRAOnIuBhE2j8DefUKgeCXEjChziqSuAMAsTPmD8a/u3
	YyrtgVT5bCPt1SMIgbbU8NH17tfRUVoIBOpu5NJPmzkXJhn0ichaOocFdDlALEVDk+Xn
	ay+lOPg4gqQlSwLHyAbO4zfbA7Vj8to4ArxEcDIgPfLkQflqwRXyx/UBk0zaVY47wWGV
	qG+g==
MIME-Version: 1.0
X-Received: by 10.140.20.226 with SMTP id 89mr3224588qgj.43.1421939563308;
	Thu, 22 Jan 2015 07:12:43 -0800 (PST)
Received: by 10.140.240.67 with HTTP; Thu, 22 Jan 2015 07:12:43 -0800 (PST)
In-Reply-To: <CAJTo0LbgjEA63TCrh=bE7HuLWE=vi5PTgK1h0f0-YLBaXgbjnA@mail.gmail.com>
References: <1421165391-30203-1-git-send-email-denis@denix.org>
	<CAP9ODKoygArG8C+wJm7buqgfnjU_MkvfOxoiFGKNfjhAXYgc9g@mail.gmail.com>
	<20150121191123.GH20639@denix.org>
	<CAP9ODKrsE7aWFdVtMrfns3DhC0XJTP=2umjhsU=EZcMmd4EVUQ@mail.gmail.com>
	<20150121202005.GK20639@denix.org>
	<CAENGNheynLDPzuS6xEJTLbkuheB93cH0wsa2DY-M6i=jqHkdvA@mail.gmail.com>
	<CAJTo0LbY54BAQAx1HcgwBZNGNPSwEzmV6zhbn_mB76=vLnkWxg@mail.gmail.com>
	<20150122145715.GO20639@denix.org>
	<CAJTo0LbgjEA63TCrh=bE7HuLWE=vi5PTgK1h0f0-YLBaXgbjnA@mail.gmail.com>
Date: Thu, 22 Jan 2015 13:12:43 -0200
Message-ID: <CAENGNhe86vFB35cJY=xAtiZW6zdjGTB3dQHzgJu7YYefa43QGw@mail.gmail.com>
From: Raphael Philipe <rapphil@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Denys Dmytriyenko <denys@ti.com>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2015.01
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
X-List-Received-Date: Thu, 22 Jan 2015 15:12:45 -0000
Content-Type: text/plain; charset=UTF-8

Ross,

Is u-boot-fw-utils-cross that you are talking about?

On Thu, Jan 22, 2015 at 1:02 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 22 January 2015 at 14:57, Denys Dmytriyenko <denis@denix.org> wrote:
>>
>> Please note that he's talking about current 2014.07 version, not the
>> update!
>> Can you confirm that it works or fails on the autobuilder?
>
>
> Sorry, got lost in the thread.  The old version works fine, the upgrade
> breaks.
>
> Ross

