Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1Q5KbO-000223-QG; Thu, 31 Mar 2011 18:20:06 +0200
Received: by fxm19 with SMTP id 19so2239482fxm.6
	for <multiple recipients>; Thu, 31 Mar 2011 09:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=cm+QY1AK/uLhkgme+l1muJce9V879E1iWdUrzmV7Ijg=;
	b=BsEfyJEijBlKTK04BAyhmGuSHPCK1OQvjOJgNyE0RHxVvFi9mt/4peTAZW3lDkM8pm
	1lQLjHdNGoVEyWRHAEeZg/A40bXPEiZlM8mtRzLTto8IzwyibIPXW2UMQ/nC/CPTHlkX
	TTBCjefZIfZyxae7h9CGHUmTlhbvL4I58GbF4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=LYbI2Eq9Bo63hiF70jYHwdERMbVvT9vMPbCncUFvvoj1ee0vr32umXbkotZbFmt9xF
	Z9NAOxZ3TOaGozaR/FcTl7OyVPZ4qai0w40GDXIswZi/hvv1lURL63hjJynHhYeZG9rZ
	dj/C6xpK6hmdya2K8YUOFZzKM6ciceeiNYvY8=
MIME-Version: 1.0
Received: by 10.223.102.80 with SMTP id f16mr1219845fao.33.1301588286635; Thu,
	31 Mar 2011 09:18:06 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.223.58.139 with HTTP; Thu, 31 Mar 2011 09:18:06 -0700 (PDT)
Date: Thu, 31 Mar 2011 09:18:06 -0700
X-Google-Sender-Auth: c9UVpUAiigs4DVP6A46WiKm_eVU
Message-ID: <AANLkTi=ka97U0ocV3z_w=Xt1d93F7NmLkUK9ypt4v3PQ@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: AGENDA: OpenEmbedded Technical Steering Committee, 31 March 2011
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
X-List-Received-Date: Thu, 31 Mar 2011 16:20:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

This agenda is posted for comment

AGENDA: OpenEmbedded Technical Steering Committee, 31 March 2011
___________________________________
 01) Agree on meeting chair
___________________________________
 02) Status report on oe-core

action items:
  general: encourage more distros to participate in oe-core
  general: invite more people to meta-oe on the oe-devel mailing list
  interested parties: discuss documentation
  Jefro volunteers to wikify checklist if someone sends
___________________________________
 03) Status report on pull model, contrib repo and guidelines

action items:
  khem will try to write up how to use contrib repos
  Mark hopes to post commit/patch policy guidelines tomorrow, has feedback
to incorporate
  Koen would like to copy oe-core guidelines as much as possible for meta-oe
layer
___________________________________
 04) Status report on board support layer guidelines

action items:
  Richard has action to write proposal for YP steering group, won't have
answer until their meeting
___________________________________
 05) Status report on version retention policy and interaction with
 oe-core / meta-oe / $distro layers

previous action items:
  Tom will wiki it
___________________________________
 06) Status on layer splitting of metadata

action items:
  general: keep discussions going
  RP: will take notes of experiences and needs
___________________________________
 07) DISTRO_FEATURE/MACHINE_FEATURE/libc features and other
    "flags" discussion
  [ Proposed: Tom Rini ]

action item:
  all: discuss on mailing list
___________________________________
 08) Continue discussion on posting of policies and guidelines

___________________________________
 09) Continue discussions on infrastructure items

action item:
  Jefro: write a blurb describing the change for a TSC member to post
___________________________________
 10) Last patchwork weekend for patchwork.or.org mid april.
  [ Proposed: Stefan ]

   After this weekend we should remove all patches from it and only
   use patches.oe.org from now.

action item:
   Stefan will send out mails for this.

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

