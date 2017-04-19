Return-Path: <twoerner@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id B2B03600EA;
	Wed, 19 Apr 2017 23:10:35 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id q26so33494873uaa.0;
	Wed, 19 Apr 2017 16:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BbXdLErLaWWp5Y0NMYq6WhZAVbxJ7WPWKQZspVy+tz0=;
	b=sGPemVpZ9JhUFCN0NLajeTigFkdyw1KYAG0SsNfAUMYTlCv7+vUyfWvFTxbxnjh/SR
	GOy42G2FtPb5VkX2O87JFzS2SMRzfAEL9VEJGpKFT7yR091ZxtYt4Wp+s/sgdZpgh/gp
	C/s4aSZkoXMr2ycwNgwPVBYidnmgJ8rFlLeBEPO0QV8TnZqEUYfl74o0sV+gNN1wNhkc
	nxzVt4TNTkOrXBmANc7s8KLUpvEDUKUUOiO26dwOFBxKCgLyZFUXwkP1evfEwPbziL5e
	oRMz8LFtrUb7fCl1b2XrUl7C1+mmyC38ppu3D1gsGO4pEPrbzP95932tFKpNh85T6rFG
	KOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BbXdLErLaWWp5Y0NMYq6WhZAVbxJ7WPWKQZspVy+tz0=;
	b=tNCkv7nSYmTSv9Jk4iYTGVb0Un1y78/VlltgjgGejLYN5PGrMiuTLy0M3/9+YoyJvB
	NIq3EZtXvrJto62LdqwTsY+JaeKb8uwpdS9WMQsEjFkjUk0mkP0GQfezH+aPHpPO9URL
	V5e1xLkkPz+BLW0PcL+HXPs7kUXqA2XxLIADDo/H9BtP0+2KJeeEActsz6GgOBDF2n1t
	eTJXazH1i25B0krXJBfw9GnuaLEn5zKcMcrq+gGAasx4wwn8mY60xXV3NJx9e1zsgOM3
	biINsJGHAGNqzKDqy1QKYytnawQLfJLhPdCqt5EPQ/zqGSQgcY9DPjRryaI6MsRjZIHB
	3GMg==
X-Gm-Message-State: AN3rC/64dooGnLzadH3K99O4AuLUOHnIoDO7f3qsDOxSdVqsf4qayn0I
	h2oYdjqqXvqKcHwlOXBclkbgcYbQJA==
X-Received: by 10.31.221.135 with SMTP id u129mr1760665vkg.67.1492643436650;
	Wed, 19 Apr 2017 16:10:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.30.70 with HTTP; Wed, 19 Apr 2017 16:10:36 -0700 (PDT)
In-Reply-To: <CA+YB3raLVTqo7m9XRe4S8spJh7Cm7cp+EwU78PpQbSPUW8676g@mail.gmail.com>
References: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
	<CA+YB3raLVTqo7m9XRe4S8spJh7Cm7cp+EwU78PpQbSPUW8676g@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 19 Apr 2017 19:10:36 -0400
Message-ID: <CAHUNapT9rRVGv7d=EoxaR_Zkuf+kBxeohpB_z4ryu1DbFn8Kww@mail.gmail.com>
To: Jeff Osier-Mixon <jefro@jefro.net>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] OpenEmbedded 2017 General Meeting
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
X-List-Received-Date: Wed, 19 Apr 2017 23:10:37 -0000
Content-Type: text/plain; charset=UTF-8

Could you please use
https://www.timeanddate.com/worldclock/fixedform.html to specify the
date/time?

