Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1FF7165E0C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 20:44:05 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id m20so3125973qcx.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 13:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=q0raWDPjiE8MYXUtq9rOJ+IP+58rYvFkkx/0ldbOHS4=;
	b=ayRO/+x8guv93VnKM8gCuzcfhVuLJ9PlL1jcWn8X42kAJKYgT60xevJ0FXOxudJLUM
	f6EwuOk3erIwMqAQtTJ8A/L+OE0Mc3pBBh5f5dzAAuq+lowjVVN4//d7xxt5FNy+iqXe
	N1kEFPmNcbDrTlmcJaOnDZDP5ZPk/MHXJNHmnh9hLNbJYNkf9TAMMlsfqPFFfDPt7nUQ
	SXHTQoQ8ncdftLVPz6R6AZgj6Vt0iwNBBnTmGas6AFkJgFcpDh0MbTclVEVEYizdCcXn
	d2I+/8gic86vGiPklNHCepEOsNftnBCfVk8sXXEnyY73UZeMt9ixud1eQ5k4iwB5IoVI
	CrOw==
X-Gm-Message-State: ALoCoQnTxR2kZkk5VNOHlE3wo8U6qua/+yy524Iam+9ESSTRldOk/dBrdOrWSW9vgU4+xx3nbgA0
X-Received: by 10.224.38.10 with SMTP id z10mr31131178qad.52.1410727446468;
	Sun, 14 Sep 2014 13:44:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Sun, 14 Sep 2014 13:43:46 -0700 (PDT)
In-Reply-To: <1410555811-30996-1-git-send-email-jslater@windriver.com>
References: <1410555811-30996-1-git-send-email-jslater@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 14 Sep 2014 21:43:46 +0100
Message-ID: <CAJTo0Lb7wL2J2T1u3JS6LjuuzB2wTvWbkaSL6OX+VqkB1NEptA@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sysprof: add aarch64 support
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
X-List-Received-Date: Sun, 14 Sep 2014 20:44:08 -0000
Content-Type: text/plain; charset=UTF-8

On 12 September 2014 22:03, Joe Slater <jslater@windriver.com> wrote:
> +++ b/meta/recipes-kernel/sysprof/files/rmb-arm.patch

This patch is missing a signed-off-by and upstream-status.

Ross

