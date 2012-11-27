Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TdHgN-0000G8-A1
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 10:42:31 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 27 Nov 2012 01:28:07 -0800
Received: by mail-ob0-f197.google.com with SMTP id v19so522985obq.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 01:28:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=pn6z92pVv+JLwqrhqHQcjCvxJFOg+7Z8/6e6rhPNNZc=;
	b=SPyqGYDRCvIrDcJNOFMzFSl1W2Tbkf6Me48TMKHlFBARc5Vk25vdqdXnPsJGn1h/oa
	oC/JVafQynwnPADNu2f+lw9yqurz22yegRHWTzJ9GOZ35TK3gGrITyHE7cIAhTU148+E
	2u/zfrKNtLsXG2Wt9lsNaB7gPvtPvA6Zos2MtwjobqgoSjNZ69BZhHyz5ZaRb5MRAi5M
	8vc10ndxmBdAFvA1veXHVcKLE56DmVtT23Z2LflinIvDQBaMqMwiZjId8oKjGfkaEb4K
	1TBrNoBrM3zV45OlsEJtFsF0tAFcWOf6QzDW/rW/jgke9+t4sxbwKk6eEMXXEl33VLGQ
	XCvQ==
Received: by 10.60.1.169 with SMTP id 9mr6411485oen.93.1354008486763;
	Tue, 27 Nov 2012 01:28:06 -0800 (PST)
Received: by 10.60.1.169 with SMTP id 9mr6411480oen.93.1354008486689; Tue, 27
	Nov 2012 01:28:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Tue, 27 Nov 2012 01:27:46 -0800 (PST)
In-Reply-To: <1354007897-16888-1-git-send-email-schnitzeltony@googlemail.com>
References: <1354007897-16888-1-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Nov 2012 09:27:46 +0000
Message-ID: <CAJTo0LZ4OznwYPaCEE8q2YQa4b-KosjfVosHxY+-T_gMsgrvFw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQkWHH9Pq/cB8N0ayMvKH49P4qJKf8RhGsXOU+SbhCmE3XQerIdvamoyI00dEeDtS3EoJfsFttkdHA5vnepXGFefIWLh8R/1FxGHjg8Uel5/VjftLNueN40h+NGebAc1L1cFutl7Oi4Sos6QOqInOrgs+JoU5n5G/X1stBzmZPsWWeCxkARTbbQte8JIIXOUi9Pm5YLO
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gtk+: do not prelight GtkButton in touchscreen mode
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
X-List-Received-Date: Tue, 27 Nov 2012 09:42:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 27 November 2012 09:18, Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m> wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross


