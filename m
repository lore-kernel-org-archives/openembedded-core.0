Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CAAB9707CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 01:32:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6N1WDEI024063
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Jul 2014 18:32:13 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 22 Jul 2014 18:32:12 -0700
Message-ID: <53CF10A2.7000402@windriver.com>
Date: Wed, 23 Jul 2014 09:32:18 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1406015054.git.rongqing.li@windriver.com>
	<CAJTo0LZCtnBuZrWBuBmxdO8Z5SYRFbO1tYR2_GUCp4TNet9Ugg@mail.gmail.com>
In-Reply-To: <CAJTo0LZCtnBuZrWBuBmxdO8Z5SYRFbO1tYR2_GUCp4TNet9Ugg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/16 v2] merge 16 CVE patches
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
X-List-Received-Date: Wed, 23 Jul 2014 01:32:14 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/22/2014 04:22 PM, Burton, Ross wrote:
> On 22 July 2014 08:46,  <rongqing.li@windriver.com> wrote:
>> Yue Tao (16):
>>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0866
>>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0875
>>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0860
>>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3934
>>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3946
>>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-7023
>>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-7009
>>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0855
>>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-4351
>>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0848
>>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3944
>>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-7010
>>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3941
>>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0846
>>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2012-6618
>>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2012-6617
>
> As there's no benefit in being able to bisect this, I think it would
> be neater if these were squashed into a single commit.
>

I am fine, Saul can squash them when merge

-Roy

> Ross
>
>

-- 
Best Reagrds,
Roy | RongQing Li

