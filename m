Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1Q2Rgk-0001TW-W9; Wed, 23 Mar 2011 18:19:34 +0100
Received: by fxm19 with SMTP id 19so7743250fxm.6
	for <multiple recipients>; Wed, 23 Mar 2011 10:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=L+byn3754CwojzGCJAOSrO2Ir+pwPKzawOGyhWC8k14=;
	b=Q3tOYtNQJOl7voWEgSQATxmUv5AVnZE1/Vtc7Og1Qi6YNGrZ9Tj9Fj5L1/x81v0A9Y
	U4p0++7RHPxbJtd/W6FEeaM/rjLErJLvc1gWKQRZMaSLwTs2IKis0rM/qmWllknlfDvM
	HRo0lgwok38CzRKm9G8V0/pUYVgDNf+91tzM8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=pAcbMDwEoMJafc5siOi+K0e3ZHRjaVzu/1tInRbiwkfomZ/ZZTJhPiAQA4TcMt1r+r
	DRfDBcTc9wMGhY4t7HFLxupxCgn+RzovsMPOqgMLWbFRJ1gUzUjd6SAjWZ5TFrvJGV6A
	iEbCRTzNLSf/N560tT9mSRY7sjAplSZm1Dwm4=
MIME-Version: 1.0
Received: by 10.223.143.5 with SMTP id s5mr2119624fau.14.1300900542153; Wed,
	23 Mar 2011 10:15:42 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.223.125.83 with HTTP; Wed, 23 Mar 2011 10:15:42 -0700 (PDT)
Date: Wed, 23 Mar 2011 10:15:42 -0700
X-Google-Sender-Auth: yhg9UYZBBzo7liFOlOK44_2HTqY
Message-ID: <AANLkTinvUpiWyo4q=cijbg1B3LFdYfu2o8Y9H0sd=M6=@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: AGENDA: OE Technical Steering Committee, 24 March 2011
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
X-List-Received-Date: Wed, 23 Mar 2011 17:22:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

This agenda is posted for comment

AGENDA: OpenEmbedded Technical Steering Committee, 24 March 2011

 01) Agree on meeting chair (Khem already volunteered)
___________________________________
 02) Status report on oe-core

previous action items:
Koen to send email gathering input for checklist (sent before meeting ended)
Jefro volunteers to wikify checklist if someone sends
discussion for branding & recipe split to mailing list, Richard responded to
Koen's post already
___________________________________
 03) Status report on pull model, contrib repo and guidelines

previous action items:
Mark hopes to post commit/patch policy guidelines tomorrow, has feedback to
incorporate
Koen would like to copy oe-core guidelines as much as possible for meta-oe
layer

___________________________________
 04) Status report on board support layer guidelines

previous action items:
Richard has action to write proposal for YP steering group, won't have
answer until their meeting
___________________________________
 05) Status report on version retention policy and interaction with
 oe-core / meta-oe / $distro layers

previous action items:
Tom will wiki it
___________________________________
 06) Status on layer splitting of metadata

previous action items:
Koen volunteers to be pullmaster
Koen will move data in repo down a level into meta-oe now
___________________________________
 07) DISTRO_FEATURE/MACHINE_FEATURE/libc features and other
    "flags" discussion
  [ Proposed: Tom Rini ]

previous action items:
Tom to move to ml
___________________________________
 07) Continue discussion on posting of policies and guidelines

previous action items:
AI: Khem to highlight the oe-core ml on oe-dev, tell people about discussion
___________________________________
 08) Continue discussions on infrastructure items


-- 
Jeff Osier-Mixon
Yocto Project Community Manager @Intel

