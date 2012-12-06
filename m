Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TgYzX-00042C-RM
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 11:47:58 +0100
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 06 Dec 2012 02:33:17 -0800
Received: by mail-ie0-f197.google.com with SMTP id 16so28585697iea.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2012 02:33:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=7zR1kGORlDI6OzBETvOm3rGUeOes0g4xs4hSVbhZFvk=;
	b=b/JDfTRv4EFP1EfqBkf4jlGdL80YCxJRCWWtZefPestK80UG9V9Rp7/XPeS0ov9b8i
	e1EpzP4a70YUVf4NxHRStjtA+Q7XV3Iw4zGN/KcjG4lnc0xQokr1L//KCcPCgbCeQHVQ
	UIdrLQK3rVHbKudr0fVjVVzk0PhKe1jD9DfRcUrtLBhTwpFa4pDCt/5xXz85OMlOD0C2
	AOzrtyRYK7SiNpm7XYuPBsEMqqTrb7DcF2HSYG9A4llCbANvHp2MPrmdkfp1TJaHbHLa
	K+XFzEoQv2G+VsQ2Lhf7D//EQV9ynUAy6cMJc714t/MxdvZ4XUgYL+y50KnES2C2+a+s
	5S6g==
Received: by 10.182.48.69 with SMTP id j5mr540529obn.17.1354789996217;
	Thu, 06 Dec 2012 02:33:16 -0800 (PST)
Received: by 10.182.48.69 with SMTP id j5mr540523obn.17.1354789995951; Thu, 06
	Dec 2012 02:33:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Thu, 6 Dec 2012 02:32:54 -0800 (PST)
In-Reply-To: <cover.1354779942.git.sgw@linux.intel.com>
References: <cover.1354779942.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Dec 2012 10:32:54 +0000
Message-ID: <CAJTo0LYFKpqFU+KcH95N7BAeW9Kd3FwemhgzrXDjXJGZaFGXhg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmsFR2pjQduy+CjR3ChqIqJx8Xo6gU6Khhprp2TxJHCHiGFzJQ2ThlnJbUw/+BAe0DBW3RlYBg31CRBTM8qsmG6bASqxziN+FmvVERq8Sp9ZoWCc6kMQQOfWraZ+Xh5ksR8+0aVr6y5aynRLsYZjoW9Ab1tGaX/KE3KZnvL2cMn5cYmuBAXnb15s6l6gjG/390KuNAg
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/71] Updates and Patches (cover letter only)
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
X-List-Received-Date: Thu, 06 Dec 2012 10:47:58 -0000
Content-Type: text/plain; charset=UTF-8

On 6 December 2012 07:52, Saul Wold <sgw@linux.intel.com> wrote:
>   mesa: merge internal libraries into mesa-dri package

Remove this, Daniel has objections.

Ross


