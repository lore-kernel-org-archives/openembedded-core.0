Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwtkB-0005wg-BX
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 13:39:07 +0200
Received: from mail-gg0-f180.google.com ([209.85.161.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 04:27:26 -0700
Received: by ggnf1 with SMTP id f1so7573145ggn.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 04:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=bGjOJG5nXWiQdzaO+Hf5xG3fVCLlciwpD9gT59dsKSY=;
	b=i7jTLix5A95ONap5Kdm4x/2CSBRTbk7szRaMTDzvGfpTdBpjge/eTELkYOvv5Tn2XT
	AqtYtrYGHcqUQuhdvJrAj5Ouso4u8ipbkTyXEqJYTJZn44w6hDGxBLak7fnZBglAhcwJ
	M82zas483XoWMBo0TIDThM9X6Mkd53Mg1IENSyWZCY9612DTyr5RvbfDyG0SVIC6pUe1
	kcu1CoV8tYu3/1/5ZNkZkhohuNZOIDJNyjiwmeMqb1NS23PFkU/s95s3p7F0fAu08buK
	p6QIFFcwh4bu5YnAL5ghMkhaOG2VEBt5PSC7HRRxBUd6hUBCbCu2Xhm9tAjQGtpUXm89
	JBlA==
Received: by 10.50.163.70 with SMTP id yg6mr3000301igb.30.1343906845205; Thu,
	02 Aug 2012 04:27:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Thu, 2 Aug 2012 04:27:05 -0700 (PDT)
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Aug 2012 12:27:05 +0100
Message-ID: <CAJTo0LY4e_Boi-RU4iyu+_2gRvuvLO40b2Pu8FsCRnXqSdACvQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQm4Lm6IWrGQSMJyifsXObIcnwxFC9yZDPn6jhm+5niuw66gFRW4gD869xaynCp5YXOvedpT
Subject: Re: [PATCH 0/9] buildhistory improvements
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
X-List-Received-Date: Thu, 02 Aug 2012 11:39:07 -0000
Content-Type: text/plain; charset=UTF-8

On 2 August 2012 10:23, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> A bunch of improvements for buildhistory, implementing some feature
> requests and todo items of my own, as well as tidying up some of the
> code.

I've been using this branch for an hour or so whilst reviewing
changes, the new features are useful and it didn't break.

Acked-by: Ross Burton <ross.burton@intel.com>

Ross


