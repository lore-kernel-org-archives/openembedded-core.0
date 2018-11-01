Return-Path: <twoerner@gmail.com>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id DA05279E27
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 14:04:21 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id r5-v6so2212311ith.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 07:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=/y9ZKvInxG6T7BaY0HwwEBd4Q7wtHXRpDNCEXmZYNo8=;
	b=IPE/4QH6BsuXgOSoQN1lXXZ12uhNJxA9r68JpqaLl0YDAEbJzazQvpUbZQ9AtEHkkb
	2xZSQL4TJTksfyoWfFXyt2tMpEox0VSdncGTpHAX9wJkd16YYBna9BOeVb/uVMDrBwwV
	Gs8QSsauwGAzwkCiPFDz1yCO6bFXf8gNCqByuyI7sENhr5AnVEmiKYomu5FN61EIm9eS
	AfKZSMgN9225EhlWyZTuJGjb/oFyCclBsm5DMvFzaI0TnQgrvak6zM/BBznLSm4U36OH
	rg3IaOWRV/L2jgl0vg3IsPmOYzb0FzbDnRIhY5NTyH0XX5RKS+J4a34/njMJCwP0jtoq
	thwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=/y9ZKvInxG6T7BaY0HwwEBd4Q7wtHXRpDNCEXmZYNo8=;
	b=IQl0+KruKxN6Q4xiMuwpgKU4Se1aw+9qhyxQd3hkXDIOuccC1I/NyD2Gi6ChhM5d26
	w1iFPO/HKOhxx3HUJahHF12cgcf46Xqa8piwB6xnjJ23bWilIQOplc/NH+qrNSIMxPHo
	JIwCxfyLcIjA9eeJO/BvnrGH8t1pBhVjwCqhumTtZUoCILSr20DMM+j7ny9OzwCYIDWE
	3cZXwQpbNIklOPAtQ8i2wCD1897c+RuXS4AdBF1IG7JMWEV0Av+VkQjJK8CVdG9B9yUD
	w4qWWxRmfuNMX3mRBFp/YijOGzyWKesmqT/AGmeYjox9y7rKm/La5xxEWliyzogfE/YR
	7fuQ==
X-Gm-Message-State: AGRZ1gKRY4LwqnZRmOM5YoXKp3ZconLB28LSI4Ij6cWpEjgpPrF0/S/t
	nGzSZmcfK+F8UU96XPRTo+KyPYHo
X-Google-Smtp-Source: AJdET5c+uBcxqJiLpxjZEbpZAQeVJBVkpUhlWWUCNYRPNaHjqS0Rg37MP0Ctr9+NLUhoybSu9GSN9w==
X-Received: by 2002:a05:660c:284:: with SMTP id
	s4mr5348361itl.162.1541081062029; 
	Thu, 01 Nov 2018 07:04:22 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	q15-v6sm6998407itc.38.2018.11.01.07.04.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 07:04:20 -0700 (PDT)
Date: Thu, 1 Nov 2018 10:04:17 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org,
	yocto-advocacy@yoctoproject.org
Message-ID: <20181101140417.GA12376@linux-uys3>
MIME-Version: 1.0
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: OEDAM @ SCaLE 2019
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
X-List-Received-Date: Thu, 01 Nov 2018 14:04:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Fellow YP/OE Enthusiasts!

There were discussions at our recent OEDEM regarding:
- our next developers meeting
- SCaLE 2019
- expanding/adding to the YP/OE presence at conferences (i.e. our own
  miniconf?)

Please see time indices: 12:13 and 16:45
https://docs.google.com/document/d/1YDAHjIOXCIgvSZVOKCYLxa8h26dkruX8zspoge7zCpk

Unfortunately, although lots of opinions were expressed, nothing concrete was
decided. Many people pointed out that their travel budgets are already
strained or maxed out, so adding another conference would be difficult if not
impossible. It's unclear how many "core" YP/OE people might show up at next
year's SCaLE. Also, given that this year's ELC scheduling hiccup is a one-off,
maybe it doesn't make as much sense to put in all the work required to run an
OEDAM at SCaLE if it's only ever going to happen once. Therefore I think I can
safely say the organizing committee for YP/OE Things at SCaLE 2019 is leaning
towards not running an OEDAM.

It's not too late to change our plans. If a large number of core people reply
to this email saying they want and OEDAM in March and will be available in
Pasadena, then we could accommodate it. It's just that we didn't leave
Edinburgh with the feeling that an OEDAM at SCaLE was feasible. Also, at this
point SCaLE isn't on the radars of many of the core YP/OE people, and
currently the conference tends to attract users rather than developers (or so
is my impression).

Thoughts?

Best regards,
	Trevor

