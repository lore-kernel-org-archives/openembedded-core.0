Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Rkelv-0008NA-NK
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 17:42:04 +0100
Received: by qabj40 with SMTP id j40so191870qab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 08:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=XSoKV9Qt+R+Myr0ZPyI6mUUzjerJ84DIs/uKLL0iQNQ=;
	b=YtWRC2KKHLffmsNBG8KBbNNS5g088/7DOkpgAu4Fnq7C7eR5w9eUXiVgVs4qetC+xc
	vXFM8OXxNlQLpUOCNpkICtVxsGQ2dYppo1u1w2djV1eLR9UkUoRmjqbHe4kYb2WFklmi
	BG5oIQ2/DZK484v1RBr9NVvgU4zuI/rYffuWs=
Received: by 10.224.186.130 with SMTP id cs2mr25834662qab.82.1326213270462;
	Tue, 10 Jan 2012 08:34:30 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.187.141 with HTTP; Tue, 10 Jan 2012 08:34:09 -0800 (PST)
In-Reply-To: <4F0C637E.8050704@gherzan.ro>
References: <1326208678-17244-1-git-send-email-andrei@gherzan.ro>
	<CABcZANnzU_5LTeRV=UjPiUWn6rqnZS6RR_yhsUKE_C_ap-PZ9g@mail.gmail.com>
	<4F0C623B.7050209@gherzan.ro>
	<CABcZANmcdGtOa+K9=6Ei_vAF=BVQwa6BYAYTjpeEuCDcqPcPnQ@mail.gmail.com>
	<4F0C637E.8050704@gherzan.ro>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 10 Jan 2012 09:34:09 -0700
X-Google-Sender-Auth: zH4tCsmiGr6jDfT39VPi3QB1XRA
Message-ID: <CABcZANnXksgwqbgU_mhD4ptgEx_0=M9MUHV2uagi3owEU2yrrg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] license.bbclass base.bbclass: support for 'or' operand in LICENSE and for SPDX license names
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
X-List-Received-Date: Tue, 10 Jan 2012 16:42:04 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 10, 2012 at 9:12 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> No worries. Anyway, you are right about the "+" mechanism but right now this
> is a fast and complete solution.

Indeed, nice work on this.
-- 
Christopher Larson


