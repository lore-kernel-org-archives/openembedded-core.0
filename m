Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id C09BB6067D;
	Wed, 23 Mar 2016 16:36:52 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id td3so283pab.2;
	Wed, 23 Mar 2016 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=4Qj01y9M7MovGVDgTJg+1GcMoGrImu2rsPNzp3Y/vaE=;
	b=D22HLsPJBCi9tcWH/J5SgQHcKYKMAtsT/IyUS8VOiaX9T0ZBnWlA2iYsKAd49rncGM
	Hzh1rIuOeumMzM5ocNDTI6abIFZ9cD3bblAiPkXEy1xRvlXqUg6ft8yrGmgjWixld49a
	WbH3knHP2rE5B0uHBoXbXv65oR+Dyq6gVL7SwqjeVqiu4JpsfGntOeWd70kDKCPXInCd
	iGgvmbbQIznZzGS0E5SeaTtrLQ/o2GsrgKxjVvMBf9D+adk1oLhfOUFatfdeEWS9NIjj
	y0bQDTDHhIyDGHWhlxKrNxECt8FlO3KUxwzS3qa3l/MPJECb0ooW+1SZeH07zcb3HXfZ
	V7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=4Qj01y9M7MovGVDgTJg+1GcMoGrImu2rsPNzp3Y/vaE=;
	b=QgedBRHNSTDW7oJuGg2c9yM1JvMEx/P9WAvoCFhskYxGgLuqtcjD12ZfET1XM4q03O
	lrcqUkpBz/lXD9ehYI4GPUFfcRdHYXMUov9rnkkhnhqi5nxY6PZxITouFaVDhlFlq77Y
	UabKaiZcQwQIdeyYgDTvLCrC/aQPVwmqIJKwKcV/fIeDxmlspT2ZqrCSpNgM/h0Pt1d1
	2dW0b5ZA0KlGyUvo+ZJldtzDb6PhaVwMgIpMH/65nLOKvrQ+HU/GrvvnoRNb6ogamBST
	AfisIO+VOlrcvCU2HZAzudNLA0FROxOsbGuK/s5fSh7H8W7DAB4b76LGE3d4VXxlvxJU
	NSdg==
X-Gm-Message-State: AD7BkJLYljvnATRAC9GhNv1IL3PKzRnkZ3QQbbl1WtmXc6ORJjKOt3xxgDKbFtReRKiQXg==
X-Received: by 10.66.222.129 with SMTP id qm1mr5605664pac.22.1458751012992;
	Wed, 23 Mar 2016 09:36:52 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:4df:d6eb:1e52:fc5f?
	([2601:202:4000:1239:4df:d6eb:1e52:fc5f])
	by smtp.googlemail.com with ESMTPSA id
	s87sm5309339pfa.89.2016.03.23.09.36.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2016 09:36:51 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>
References: <56DEF97F.9070306@balister.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56F2C618.3050205@gmail.com>
Date: Wed, 23 Mar 2016 09:36:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <56DEF97F.9070306@balister.org>
Subject: Re: [oe] OEDAM, April 8 in San Diego after ELC
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
X-List-Received-Date: Wed, 23 Mar 2016 16:36:56 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 03/08/2016 08:10 AM, Philip Balister wrote:
> On the Friday after ELC in San Diego (Yocto Project Dev Day is
> Thursday), we will have a developer meeting near the conference venue
> (need to double check with Jefro about exact location).

There are only 10 people signed up.

Is that enough people to justify the expense room or even meet?

- armin
> 
> http://openembedded.org/wiki/OEDAM_2016
> 
> At these meetings we try to follow an agenda we develop before hand on
> the wiki page. I've created a rough agenda by posting notes from the
> meeting in Dublin. Everyone, please go over the notes and add remarks
> for completed items.
> 
> You can also bring up issues at the meeting. We only have one day
> scheduled for the meeting, so a little pre-planning helps keep us on time.
> 
> Everyone involved in the project is welcome to attend, no how
> knowledgeable in the overall OpenEmbedded project We like to hear from
> people from many different use cases.
> 
> Thanks,
> 
> Philip
> 

