Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <julian.pidancet@gmail.com>) id 1SHlDq-00081H-8L
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 02:15:42 +0200
Received: by wgbdr12 with SMTP id dr12so263755wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 17:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Fir2iXhuMNy9vqxxeSRBwEgFOVchtq54lg6//t0NcFY=;
	b=PlKN7d4Ju2cFvsjNY6T3YRFjp73JdXm2DS/n08IcDEKmGVGmcCdtDSvL2AQvZ0KNO8
	apNpprLA3ZhgFj6oq03x1QJLhhbLinxRJiKF9l7Sa0ejOZ+AXBRJ3sT4o78n3F5XWgDa
	Pr+nvSWTB0boUhXhTBAUEQSgqf/fdMsU+KhNtiphY1KYBqZxIe14uxI3T1UwSlmNBGuk
	2ct69gzAvjA1wLhQiKsxMtUwTYKRmskUjnrIbEF+bXuYxuxPMr16WO4O4Ot+0utDwzXr
	ihz+Zp1U80JbkSD2d8UH48g76jdaqdIfI6fyxMWEULXc6oQ8mtDp+UO7cfb4egnIcQYU
	rJLw==
Received: by 10.216.139.12 with SMTP id b12mr7615909wej.4.1334102784003;
	Tue, 10 Apr 2012 17:06:24 -0700 (PDT)
Received: from [192.168.1.110] (188-223-88-44.zone14.bethere.co.uk.
	[188.223.88.44])
	by mx.google.com with ESMTPS id gg2sm3203049wib.7.2012.04.10.17.06.22
	(version=SSLv3 cipher=OTHER); Tue, 10 Apr 2012 17:06:23 -0700 (PDT)
Message-ID: <4F84D58F.8020608@gmail.com>
Date: Wed, 11 Apr 2012 01:51:27 +0100
From: Julian Pidancet <julian.pidancet@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.3) Gecko/20120402 Thunderbird/10.0.3
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
In-Reply-To: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
Subject: Re: Yocto Project 1.2 M4 schedule
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 00:15:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/09/12 19:01, Liu, Song wrote:
> Hi all,
> 
> This is to restate and clarify the schedule for Yocto Project 1.2 M4 (milestone 4). If you are concerned or have patches you would like to merge, please see the following dates:
> 
> 1. RC3 official patch cut-off time: 12:00AM April 8th, 2012, PDT
> 2. RC3 build: April 11th, 2012, PDT
> 3. RC4 official patch cut-off time: 12:00AM April 15th, 2012, PDT
> 4. RC4 build: April 18th, 2012, PDT
> 5. YP 1.2 release: April 27th, 2012, PDT
> 
> You can also check out the schedule here: https://www.google.com/calendar/embed?height=600&wkst=1&bgcolor=%23FFFFFF&src=mg0m150m30gs891eqqhtfu5jgg%40group.calendar.google.com&color=%238C500B&src=sc7rov4ck552t2f0pav120t7r0%40group.calendar.google.com&color=%23528800&src=theyoctoproject%40gmail.com&color=%23182C57&ctz=America%2FLos_Angeles 
> 
> Please feel free to let me and Beth know if you have any concerns or questions.
> 
> Thanks!
> Song
> PM, Yocto Project

Hi,

I don't see any commits tagged for these milestones in
git.openembedded.org/openembedded-core at the moment. Will there be a
release tag or a release branch created on the git repository when YP
1.2 comes out, to indicate people that there's a "stable" version of
oe-core they can use ?

-- 
Julian


