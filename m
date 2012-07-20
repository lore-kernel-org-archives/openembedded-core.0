Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Ss7Qi-0003ry-EL
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 09:15:16 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 20 Jul 2012 00:03:51 -0700
Received: by wgbdr13 with SMTP id dr13so2319192wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 00:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:cc:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type:content-transfer-encoding
	:content-disposition:x-gm-message-state;
	bh=0IS3zdcSyMaY9zkZFZvhyfZ3o+8urjzyGwDD/4c50Fc=;
	b=QaaZv1IOwguc9w6iZZLiqFZT1wV+2iLOMIQM299v1util/GxhlCv4LOpKitqhFWXlS
	uIVbR1MHxQdFUyvKMABvJCAAEReqpQMEfRJlcit8bTdgXr9gjM7KjnkLp6KHHTWb9TUI
	2lSz7HfFw71o7z9amoUWoDiCrQJnKgnnfEiR82DbEs6tsb6LfGSTUVW0k1B2pO5F+sKn
	tFqWib4wZ1eapXCPZOb8wYW/BbrgGfnCAUJlNRSNhZzCCkR6OHwDCECGP042G859dOvG
	RNbSC+JZJVcbflkQTHK2RSFtb432W94mYo9WHOCthTZob9WasUyAx1QzRxMVequ7BwPb
	/lvA==
Received: by 10.180.88.102 with SMTP id bf6mr6973178wib.4.1342767830392;
	Fri, 20 Jul 2012 00:03:50 -0700 (PDT)
Received: from [192.168.1.12] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id h9sm42981322wiz.1.2012.07.20.00.03.48
	(version=SSLv3 cipher=OTHER); Fri, 20 Jul 2012 00:03:49 -0700 (PDT)
Date: Fri, 20 Jul 2012 08:03:53 +0100
From: Ross Burton <ross.burton@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <7D478CDEE69A4F1CA7485BD18027A79D@intel.com>
In-Reply-To: <5008E1C8.9030501@linux.intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
	<5008E1C8.9030501@linux.intel.com>
X-Mailer: sparrow 1.6.2 (build 1143.6)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQks5OF4RRqVJ1g8iw5Ix1lgEcS6sm7L65sR+F4AINQEjgAHsWHgalxckc41DsL0KvMfVarY
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/26] Use gtk-doc-stub
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
X-List-Received-Date: Fri, 20 Jul 2012 07:15:16 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday, 20 July 2012 at 05:42, Saul Wold wrote:
> While you have SOB's in the email, the branch itself does not have any 
> SOBs which is where I was pulling from.

That's a very good point.  I'll SOB it and repush shortly.

Ross 




