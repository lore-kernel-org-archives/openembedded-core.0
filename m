Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C1271786EF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 10:37:56 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w65AbsIe001815
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 5 Jul 2018 11:37:55 +0100
Message-ID: <5f0f706dd455f81793501c7e48dc30f29d26d092.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 05 Jul 2018 11:37:54 +0100
In-Reply-To: <CA+chaQdQfoBLr9Z6EAaXPAzMWL2Z8AdB2d6owge-H_6o1q86Vw@mail.gmail.com>
References: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
	<20180704200654.285-1-Martin.Jansa@gmail.com>
	<CAP71Wjwy0T-s7-D+aRDRwcH+w0nBD0gSV_HN3hFi6qpYnWfnkw@mail.gmail.com>
	<df456e87b2e9b34cff9991b91c98717020bfb3c9.camel@linuxfoundation.org>
	<CA+chaQdQfoBLr9Z6EAaXPAzMWL2Z8AdB2d6owge-H_6o1q86Vw@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kernel-devicetree: Corrected normalize_dtb"
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
X-List-Received-Date: Thu, 05 Jul 2018 10:37:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-07-05 at 10:38 +0200, Martin Jansa wrote:
> I am out til Sunday, so please someone else please resend just the
> revert. Next week I will check the ppc issue and resend the rest (v2
> is the same as v3 except the rebase after this change, so after
> revert the v2 will apply cleanly again)

Thanks for the info, I've rebased the revert in -next.

Cheers,

Richard

