Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TiXAw-0008B3-2w
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 22:15:38 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 11 Dec 2012 13:00:59 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so21550181oag.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 13:00:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=j7+st49cYxjM2kuhsDq2SbICbz6IImi2BW5nB1Aj70U=;
	b=bNKlPWmfc17u6dyCE7fHJDEyTtZPIHW0a3jASvAQs6UF2f6EyxybYiPFmLQOLqs7UQ
	wSA28Prm2rusAPRXIlUozT8YvcDh+/TMoXqxgqLDfmZLxCswlV2YHujJF03XSgLK4Tfc
	2Ql59OIgrOapj9YSm9yWEDzBZ0WSi1KqqwZuzKSii3Jh4goSW0VoF1FooXev+pHOriSO
	L/NHjgn0sEpR/2S2tVLDsopnpwgCKYMf5cww5NEa9qfkboJ6UJ7yLBoGJCIxJiazKIZl
	iUnpB7A9eZOz9UWTXBnG1bFyN36wVAOVPGPNDIyA8JHddLzLHdwFUuJtixyPcFdlX2Qg
	oGDw==
Received: by 10.60.31.49 with SMTP id x17mr10356354oeh.33.1355259658269;
	Tue, 11 Dec 2012 13:00:58 -0800 (PST)
Received: by 10.60.31.49 with SMTP id x17mr10356349oeh.33.1355259658175; Tue,
	11 Dec 2012 13:00:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Tue, 11 Dec 2012 13:00:37 -0800 (PST)
In-Reply-To: <a8fd6c6c5b82bf945b16ac50a63420c918c6acb4.1355214185.git.alexandru.damian@intel.com>
References: <cover.1355214185.git.alexandru.damian@intel.com>
	<a8fd6c6c5b82bf945b16ac50a63420c918c6acb4.1355214185.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Dec 2012 21:00:37 +0000
Message-ID: <CAJTo0LYmts5_GjaEahxrE_t0+W6m_B1g-0bdfnyG6Q6_aAuS-w@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQmP/lqgJkwidG1uyewZZ//eTL7tzBsLvOlHfJV6s+EAH9542c+7hI6GUnSSL34KF5mk/PucXfuOdCYmVES5tiqkYgQ98gg88GKtETL3w402gPDurAnSHcBbdD+IhKkyCBqChgALoEPpLeI4/U3+NJJJfoLYQ+7vwymJyxdSIB4gSUZoWietps1cXPdUsvK2x7SrF0rf
Cc: damien.lespiau@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/8] Wayland userspace library initial 1.0.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2012 21:15:38 -0000
Content-Type: text/plain; charset=UTF-8

On 11 December 2012 08:29, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> This patch is specifically based on work by Damien Lespiau for
> collabora, but updated to build wayland 1.0.2.

Damien Lespiau is an Intel employee, nothing to do with Collabora.
Anything mentioning Damien predates Collabora's interest in Yocto.

Ross


