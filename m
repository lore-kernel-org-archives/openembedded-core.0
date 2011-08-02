Received: from mail-ey0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QoNf9-0001y7-Et
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 00:42:12 +0200
Received: by eya28 with SMTP id 28so258569eya.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2011 15:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=pnJ4ecCyQOgw9gjfoTb7NOLVOhtx+LgY3Cth2bXdnCI=;
	b=nyNVMHiuFgOqKTfioJMMiCmNFCD8ulahuq/8RwoLo1qJ8I/LqDwF75goRluvBFgHPw
	SjjWaAxg4N2i+Oq4nNMGpIXYK0Uw/yjbVkktXxXi6u7sH7N+7was8+HrmmJCVMTr6Dia
	dGS082V6w3SfiqDuovgQ1oS2s1ZvUkhKlPeUc=
MIME-Version: 1.0
Received: by 10.213.102.9 with SMTP id e9mr5935ebo.91.1312324669779; Tue, 02
	Aug 2011 15:37:49 -0700 (PDT)
Received: by 10.213.113.196 with HTTP; Tue, 2 Aug 2011 15:37:49 -0700 (PDT)
In-Reply-To: <53D0B8FD-2805-4C48-8B5E-669A96CD9962@dominion.thruhere.net>
References: <CAD=GYpYeDmU6CN1MzztiKsf+tfOrWgBmkGfQoSpSRhoToDDskg@mail.gmail.com>
	<53D0B8FD-2805-4C48-8B5E-669A96CD9962@dominion.thruhere.net>
Date: Tue, 2 Aug 2011 17:37:49 -0500
Message-ID: <CAD=GYpbm4bxYWtDyfaH5Y1dZAwVg=J8PxFAuZv=5oh4ZH1VJ_Q@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: systemd-gnome-image do_rootfs failure
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
X-List-Received-Date: Tue, 02 Aug 2011 22:42:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 2, 2011 at 5:09 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
>
> Op 2 aug. 2011 om 23:57 heeft Joel A Fernandes <agnel.joel@gmail.com> het volgende geschreven:
>
>> I'd like to report a possible problem with oe-core that I'm not sure how to fix:
>
> ./oebb.sh update

I see you fixed it in [1] , nice, thanks :)

Regards,
Joel

[1] http://cgit.openembedded.org/cgit.cgi/openembedded-core/commit/?id=2a41a311ddda11713296391050f3c2c1b2c1d3d3


