Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 051426E5CB;
	Wed, 23 Mar 2016 21:08:49 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id p21so4626860ioe.1;
	Wed, 23 Mar 2016 14:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ibMmHd7kgOuxZVJWIFTuteNLPVmab18cGzetoiZ8I2c=;
	b=Jsn3rpVlpdtgas13pIPEOSsE8odQKDSkUEg/K+RTCuX2mFd8TchN2W6aNmWxPAFzTF
	s+Thw2d40syHdg+nki7TkcQA64vNcQ8oo+gWHVlKQBfecQ3X+6hXBWW+3+Bt0XpfD5MZ
	FAfoorwppQkJfDeAsYCDXm6daaoWDORwdvzgGWejz4wvnHYoa/CgQIDaY5SODRPWQYC6
	8BVDDe3YBjrPWsu9o7fmJi24lIcbQ+FCuNUoNMjEpSdNRXntCDJLQXpoRFd6CoLrr8F/
	eqAFbN1NOMNgRjlU1BLOSQBHyXLn0Kjd+KG0F85GFbz/8oY2x+kLTg9bTsXEnVQUumqy
	G0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ibMmHd7kgOuxZVJWIFTuteNLPVmab18cGzetoiZ8I2c=;
	b=Cmd7i4Si+i+155NpagQM0mMkFeSuUh/YLGQz67y9hSpEUtTHRwH+GpCk7GnlrZnNd/
	LpVMbAjrkS3WUAXpARq9SxNy2k0y24phEtTCZP2SheLq7GsIa+o8/yankAapfYOmajiR
	0kThzlKgDYJKf5fvk+mVLttbyPHUxpSOg3JZNCxtGhmwxs1tEDFB5dajEEjT3MPzljTi
	yj/isMrIsUWeHYv/Q/TCsecx3/aQR7Xjcy49lMS6qW9TZ+/ecom7Ox8XZKgtnOvE8jrw
	AlQqc6V/GEq77q0LwSZLNTHNxCvRKXjIEP+erfgyfQr4S+xvVrkthpL1LzQMgYYboMk5
	OImg==
X-Gm-Message-State: AD7BkJLv0Sw2KpTOMI6LcK1n8psM8WnmkQ0ilWGeNRk3NpvHMk0jTEr251tFnSCIrf1ggg==
X-Received: by 10.50.29.3 with SMTP id f3mr5935151igh.59.1458767330203;
	Wed, 23 Mar 2016 14:08:50 -0700 (PDT)
Received: from linux-yxv0 (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id p8sm9894659igi.2.2016.03.23.14.08.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Mar 2016 14:08:49 -0700 (PDT)
Date: Wed, 23 Mar 2016 17:08:50 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: akuster808 <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>
Message-ID: <20160323210850.GA5376@linux-yxv0>
References: <56DEF97F.9070306@balister.org>
 <56F2C618.3050205@gmail.com>
MIME-Version: 1.0
In-Reply-To: <56F2C618.3050205@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 23 Mar 2016 21:08:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed 2016-03-23 @ 09:36:40 AM, akuster808 wrote:
> There are only 10 people signed up.
> Is that enough people to justify the expense room or even meet?

I have no idea what the budget might be or what a room might cost. I'll leave
it to those who do know to worry about the costs versus the benefits.

In any case I certainly think it's still worth meeting. A smaller, more
focused group can sometimes get more done than a larger group. Secondly, it's
my experience that more people always show up than sign up.

With a project like this there will always be things to discuss, and sometimes
a discussion goes better in person rather than online.

Best regards,
	Trevor

